using System.Text.Json;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Text; // ДОБАВЛЕНО: Для решения ошибки CS0103 и потенциальной работы с кодировкой
using MauiApp1.Services;

namespace MauiApp1
{
    public partial class MainPage : ContentPage
    {
        // 1. Клиент для API расписания (БЕЗ заголовков авторизации)
        private HttpClient _scheduleHttpClient = new HttpClient();
        // 2. Клиент для AI сервиса
        private HttpClient _aiHttpClient = new HttpClient();

        private HuggingFaceService _aiService;
        private List<Branch> _branches = new List<Branch>();
        private List<Employee> _employees = new List<Employee>();
        private ObservableCollection<ScheduleDay> _scheduleData = new ObservableCollection<ScheduleDay>();
        private List<ScheduleItem> _allScheduleItems = new List<ScheduleItem>();
        private ObservableCollection<ChatMessage> _chatHistory = new ObservableCollection<ChatMessage>();

        public MainPage()
        {
            InitializeComponent();
            ScheduleCollectionView.ItemsSource = _scheduleData;
            ChatHistoryView.ItemsSource = _chatHistory;

            // Инициализация AI сервиса с его отдельным клиентом
            _aiService = new HuggingFaceService(_aiHttpClient);
            LoadBranches();
        }

        private async void LoadBranches()
        {
            try
            {
                LoadingIndicator.IsVisible = true;
                LoadingIndicator.IsRunning = true;

                // Используем _scheduleHttpClient
                var response = await _scheduleHttpClient.GetStringAsync("https://api-schedule.ruc.su/api/v1/get_branches");
                _branches = JsonSerializer.Deserialize<List<Branch>>(response, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                }) ?? new List<Branch>();

                BranchPicker.ItemsSource = _branches.Select(b => b.Name).ToList();
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Failed to load branches: {ex.Message}", "OK");
            }
            finally
            {
                LoadingIndicator.IsVisible = false;
                LoadingIndicator.IsRunning = false;
            }
        }

        private async void OnBranchSelectionChanged(object sender, EventArgs e)
        {
            if (BranchPicker.SelectedIndex >= 0)
            {
                var selectedBranch = _branches[BranchPicker.SelectedIndex];
                await LoadEmployees(selectedBranch.Guid);
            }
        }

        private async Task LoadEmployees(string branchGuid)
        {
            try
            {
                LoadingIndicator.IsVisible = true;
                LoadingIndicator.IsRunning = true;

                // Используем _scheduleHttpClient
                var response = await _scheduleHttpClient.GetStringAsync($"https://api-schedule.ruc.su/api/v1/get_employees/{branchGuid}");
                _employees = JsonSerializer.Deserialize<List<Employee>>(response, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                }) ?? new List<Employee>();

                EmployeePicker.ItemsSource = _employees.Select(e => e.Name).ToList();
                EmployeePicker.IsEnabled = true;
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Failed to load employees: {ex.Message}", "OK");
            }
            finally
            {
                LoadingIndicator.IsVisible = false;
                LoadingIndicator.IsRunning = false;
            }
        }

        private async void OnLoadScheduleClicked(object sender, EventArgs e)
        {
            if (BranchPicker.SelectedIndex < 0 || EmployeePicker.SelectedIndex < 0)
            {
                await DisplayAlert("Error", "Please select both branch and employee", "OK");
                return;
            }

            string response = null;

            try
            {
                LoadingIndicator.IsVisible = true;
                LoadingIndicator.IsRunning = true;

                var selectedBranch = _branches[BranchPicker.SelectedIndex];
                var selectedEmployee = _employees[EmployeePicker.SelectedIndex];
                var formattedDate = ScheduleDatePicker.Date.ToString("yyyy.MM.dd");

                var url = $"https://api-schedule.ruc.su/api/v1/get_schedule/employee/{selectedBranch.Guid}/{selectedEmployee.GUID}/{formattedDate}";

                // Используем рабочий метод
                response = await _scheduleHttpClient.GetStringAsync(url);

                // Проверяем, что ответ не пустой
                if (string.IsNullOrWhiteSpace(response))
                {
                    throw new Exception("Ответ от сервера расписания пустой.");
                }

                var scheduleResponse = JsonSerializer.Deserialize<ScheduleResponse>(response, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                });

                if (scheduleResponse == null || scheduleResponse.Schedule == null)
                {
                    // Если десериализация прошла, но Schedule=null, возможно, API вернул ошибку
                    throw new Exception("Сервер вернул данные, но расписание не найдено (Schedule=null).");
                }

                DisplaySchedule(scheduleResponse.Schedule);
            }
            catch (Exception ex)
            {
                // Если произошла ошибка парсинга, то response содержит что-то неверное
                string errorMessage = $"Failed to load schedule: {ex.Message}";

                // Если это ошибка парсинга JSON, добавим информацию о начале ответа
                if (ex is System.Text.Json.JsonException)
                {
                    errorMessage += $"\nJSON PARSING FAILED. Response starts with: {response?.Substring(0, Math.Min(response.Length, 150))}";
                }

                await DisplayAlert("Error", errorMessage, "OK");
            }
            finally
            {
                LoadingIndicator.IsVisible = false;
                LoadingIndicator.IsRunning = false;
            }
        }

        private void DisplaySchedule(Dictionary<string, List<ScheduleItem>>? schedule)
        {
            _scheduleData.Clear();
            _allScheduleItems.Clear();

            if (schedule == null || !schedule.Any())
            {
                ScheduleFrame.IsVisible = false;
                DisplayAlert("Info", "No schedule data found for the selected parameters", "OK");
                return;
            }

            foreach (var day in schedule)
            {
                var scheduleDay = new ScheduleDay
                {
                    DayHeader = day.Key,
                    Classes = new ObservableCollection<ScheduleClass>()
                };

                foreach (var item in day.Value)
                {
                    item.Data = day.Key;
                    _allScheduleItems.Add(item);

                    scheduleDay.Classes.Add(new ScheduleClass
                    {
                        TimeRange = $"{item.Time_start} - {item.Time_end}",
                        Discipline = item.Discipline,
                        Type = item.Type,
                        Group = item.Group,
                        ClassroomInfo = $"Кабинет: {item.Classroom}",
                        Employee = item.Employee
                    });
                }

                _scheduleData.Add(scheduleDay);
            }

            ScheduleFrame.IsVisible = true;
        }

        private async void OnSendMessageClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ChatInput.Text))
                return;

            var userMessage = ChatInput.Text.Trim();
            ChatInput.Text = string.Empty;

            var userChatMessage = new ChatMessage
            {
                Sender = "Вы",
                Message = userMessage,
                Timestamp = DateTime.Now.ToString("HH:mm"),
                BackgroundColor = Colors.LightBlue,
                SenderColor = Colors.DarkBlue,
                HorizontalAlignment = LayoutOptions.End
            };
            _chatHistory.Add(userChatMessage);

            try
            {
                var scheduleData = _allScheduleItems.Select(item => new
                {
                    date = item.Data,
                    lessons = new[]
                    {
                        new
                        {
                            timeStart = item.Time_start,
                            timeEnd = item.Time_end,
                            type = item.Type,
                            discipline = item.Discipline,
                            group = item.Group,
                            classroom = item.Classroom
                        }
                    }
                }).ToList<object>();

                var chatHistory = _chatHistory.Take(_chatHistory.Count - 1).Select(msg => new
                {
                    role = msg.Sender == "Вы" ? "user" : "assistant",
                    text = msg.Message
                }).ToList<object>();

                // Вызов AI сервиса (использует _aiHttpClient)
                var aiResponse = await _aiService.SendMessageAsync(userMessage, scheduleData, chatHistory);

                var aiChatMessage = new ChatMessage
                {
                    Sender = "AI Помощник",
                    Message = aiResponse,
                    Timestamp = DateTime.Now.ToString("HH:mm"),
                    BackgroundColor = Colors.LightGreen,
                    SenderColor = Colors.DarkGreen,
                    HorizontalAlignment = LayoutOptions.Start
                };
                _chatHistory.Add(aiChatMessage);

                ChatHistoryView.ScrollTo(_chatHistory.Last(), null, ScrollToPosition.End, true);
            }
            catch (Exception ex)
            {
                await DisplayAlert("Ошибка", $"Не удалось получить ответ от AI (Hugging Face): {ex.Message}", "OK");
            }
        }
    }

    // Вспомогательные классы (должны быть ТОЧНО такими, как в API)
    public class Branch
    {
        public string Guid { get; set; }
        public string Name { get; set; }
    }

    public class Employee
    {
        public string GUID { get; set; }
        public string Name { get; set; }
    }

    public class ScheduleResponse
    {
        public Dictionary<string, List<ScheduleItem>> Schedule { get; set; }
    }

    public class ScheduleItem
    {
        public string Time_start { get; set; }
        public string Time_end { get; set; }
        public string Discipline { get; set; }
        public string Type { get; set; }
        public string Group { get; set; }
        public string Classroom { get; set; }
        public string Employee { get; set; }
        public string Data { get; set; }
    }

    public class ScheduleDay
    {
        public string DayHeader { get; set; }
        public ObservableCollection<ScheduleClass> Classes { get; set; }
        public bool HasClasses => Classes?.Any() == true;
        public bool HasNoClasses => !HasClasses;
    }

    public class ScheduleClass
    {
        public string TimeRange { get; set; }
        public string Discipline { get; set; }
        public string Type { get; set; }
        public string Group { get; set; }
        public string ClassroomInfo { get; set; }
        public string Employee { get; set; }
    }

    public class ChatMessage
    {
        public string Sender { get; set; }
        public string Message { get; set; }
        public string Timestamp { get; set; }
        public Color BackgroundColor { get; set; }
        public Color SenderColor { get; set; }
        public LayoutOptions HorizontalAlignment { get; set; }
    }
}
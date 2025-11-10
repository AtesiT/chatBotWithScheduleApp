using System.Text.Json;
using System.Collections.ObjectModel;
using System.Net.Http;

namespace MauiApp1
{
    public partial class MainPage : ContentPage
    {
        private HttpClient _httpClient = new HttpClient();
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
            LoadBranches();
        }

        private async void LoadBranches()
        {
            try
            {
                LoadingIndicator.IsVisible = true;
                LoadingIndicator.IsRunning = true;

                var response = await _httpClient.GetStringAsync("https://api-schedule.ruc.su/api/v1/get_branches");
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

                var response = await _httpClient.GetStringAsync($"https://api-schedule.ruc.su/api/v1/get_employees/{branchGuid}");
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

            try
            {
                LoadingIndicator.IsVisible = true;
                LoadingIndicator.IsRunning = true;

                var selectedBranch = _branches[BranchPicker.SelectedIndex];
                var selectedEmployee = _employees[EmployeePicker.SelectedIndex];
                var formattedDate = ScheduleDatePicker.Date.ToString("yyyy.MM.dd");

                var url = $"https://api-schedule.ruc.su/api/v1/get_schedule/employee/{selectedBranch.Guid}/{selectedEmployee.GUID}/{formattedDate}";
                var response = await _httpClient.GetStringAsync(url);

                var scheduleResponse = JsonSerializer.Deserialize<ScheduleResponse>(response, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                });

                DisplaySchedule(scheduleResponse?.Schedule);
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Failed to load schedule: {ex.Message}", "OK");
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

            // Добавляем сообщение пользователя
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
                // Подготавливаем данные для AI
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

                // Подготавливаем историю чата
                var chatHistory = _chatHistory.Take(_chatHistory.Count - 1).Select(msg => new
                {
                    role = msg.Sender == "Вы" ? "user" : "assistant",
                    text = msg.Message
                }).ToList<object>();

                // Debug: Log the data being sent
                Console.WriteLine($"Schedule Data: {JsonSerializer.Serialize(scheduleData, new JsonSerializerOptions { WriteIndented = true })}");
                Console.WriteLine($"Chat History: {JsonSerializer.Serialize(chatHistory, new JsonSerializerOptions { WriteIndented = true })}");
                Console.WriteLine($"User Query: {userMessage}");

                // Здесь будет вызов сервиса YandexGPT
                // var aiResponse = await _yandexGptService.SendMessageAsync(userMessage, scheduleData, chatHistory);
                var aiResponse = "Функция AI временно недоступна";

                // Добавляем ответ AI
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

                // Прокрутка к последнему сообщению
                ChatHistoryView.ScrollTo(_chatHistory.Last(), null, ScrollToPosition.End, true);
            }
            catch (Exception ex)
            {
                await DisplayAlert("Ошибка", $"Не удалось получить ответ от AI: {ex.Message}", "OK");
            }
        }
    }

    // Вспомогательные классы
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
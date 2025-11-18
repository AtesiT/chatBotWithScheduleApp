using System.Text;
using System.Text.Json;
using System.Net.Http.Headers;

namespace MauiApp1.Services
{
    public class HuggingFaceService
    {
        private readonly HttpClient _httpClient;

        // !!! ЗАМЕНИТЕ на ваш токен Hugging Face (hf_...) !!!
        private readonly string _apiKey = "API";

        // !!! ИЗМЕНЕНИЕ: Используем поддерживаемую Llama 3 !!!
        private readonly string _modelName = "meta-llama/Meta-Llama-3-8B-Instruct";

        // URL роутера остается правильным
        private readonly string _modelUrl = "https://router.huggingface.co/v1/chat/completions";

        public HuggingFaceService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> SendMessageAsync(string query, IEnumerable<object> scheduleData, IEnumerable<object> history)
        {
            var scheduleJson = JsonSerializer.Serialize(scheduleData);
            var systemPrompt = $"Вы - помощник для работы с расписанием. Отвечайте на вопросы о расписании занятий. Данные расписания: {scheduleJson}";


            var messages = new List<object>
            {
                new { role = "system", content = systemPrompt }
            };

            if (history != null)
            {
                foreach (dynamic msg in history)
                {
                    messages.Add(new { role = msg.role, content = msg.text });
                }
            }

            messages.Add(new { role = "user", content = query });

            var requestBody = new
            {
                model = _modelName, // <-- Передача новой модели
                messages = messages,
                parameters = new
                {
                    temperature = 0.3,
                    max_new_tokens = 2000
                },
                options = new
                {
                    use_cache = false
                }
            };

            var json = JsonSerializer.Serialize(requestBody, new JsonSerializerOptions { WriteIndented = true });
            Console.WriteLine($"Request Body: {json}");

            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using var request = new HttpRequestMessage(HttpMethod.Post, _modelUrl);
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", _apiKey);
            request.Content = content;

            var response = await _httpClient.SendAsync(request);

            if (!response.IsSuccessStatusCode)
            {
                var errorText = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"HuggingFace API Error: {response.StatusCode} - {errorText}");
                throw new Exception($"HuggingFace API Error: {response.StatusCode} - {errorText}");
            }

            // ... (логика парсинга ответа)

            var responseData = await response.Content.ReadAsStringAsync();

            using var document = JsonDocument.Parse(responseData);
            var root = document.RootElement;

            if (root.TryGetProperty("choices", out var choices) &&
                choices.ValueKind == JsonValueKind.Array &&
                choices.GetArrayLength() > 0)
            {
                var firstChoice = choices[0];
                if (firstChoice.TryGetProperty("message", out var message) &&
                    message.TryGetProperty("content", out var text))
                {
                    return text.GetString()?.Trim() ?? throw new Exception("Пустой текст ответа от HuggingFace API");
                }
            }

            throw new Exception("Неожиданная структура ответа от HuggingFace API");
        }
    }
}
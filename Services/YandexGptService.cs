using System.Text;
using System.Text.Json;
using System.Net.Http.Headers;

namespace MauiApp1.Services
{
    public class YandexGptService
    {
        private readonly HttpClient _httpClient;
        private readonly string _apiKey = "YOUR_API_KEY_HERE";
        private readonly string _modelUrl = "gpt://b1gmc1h15deic25rfgnz/yandexgpt-lite";

        public YandexGptService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> SendMessageAsync(string query, IEnumerable<object> scheduleData, IEnumerable<object> history)
        {
            var systemPrompt = "Вы - помощник для работы с расписанием. Отвечайте на вопросы о расписании занятий.";

            var messages = new List<object>
            {
                new { role = "system", text = systemPrompt }
            };

            if (history != null)
            {
                foreach (var msg in history)
                {
                    messages.Add(msg);
                }
            }

            messages.Add(new { role = "user", text = query });

            var requestBody = new
            {
                modelUri = _modelUrl,
                completionOptions = new
                {
                    stream = false,
                    temperature = 0.3,
                    maxTokens = 2000
                },
                messages
            };

            var json = JsonSerializer.Serialize(requestBody, new JsonSerializerOptions { WriteIndented = true });
            Console.WriteLine($"Request Body: {json}");

            var content = new StringContent(json, Encoding.UTF8, "application/json");
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Api-Key", _apiKey);

            var response = await _httpClient.PostAsync("https://llm.api.cloud.yandex.net/foundationModels/v1/completion", content);

            if (!response.IsSuccessStatusCode)
            {
                var errorText = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"YandexGPT API Error: {response.StatusCode} - {errorText}");
                throw new Exception($"YandexGPT API Error: {response.StatusCode} - {errorText}");
            }

            var responseData = await response.Content.ReadAsStringAsync();
            Console.WriteLine($"Response Data: {responseData}");

            using var document = JsonDocument.Parse(responseData);
            var root = document.RootElement;

            if (root.TryGetProperty("result", out var result) &&
                result.TryGetProperty("alternatives", out var alternatives) &&
                alternatives.ValueKind == JsonValueKind.Array &&
                alternatives.GetArrayLength() > 0)
            {
                var firstAlternative = alternatives[0];
                if (firstAlternative.TryGetProperty("message", out var message) &&
                    message.TryGetProperty("text", out var text))
                {
                    return text.GetString()?.Trim() ?? throw new Exception("Пустой текст ответа от API YandexGPT");
                }
            }

            throw new Exception("Неожиданная структура ответа от YandexGPT API");
        }
    }
}
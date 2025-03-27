from django.shortcuts import render
from django.http import JsonResponse
from django.conf import settings
import json
from openai import OpenAI
import tiktoken

class APIUsageTracker:
    def __init__(self):
        self.encoder = tiktoken.encoding_for_model("gpt-3.5-turbo")
        self.total_tokens = 0
        self.total_cost = 0

    def count_tokens(self, text):
        return len(self.encoder.encode(text))

    def calculate_cost(self, input_tokens, output_tokens):
        input_cost = (input_tokens / 1000) * 0.0015
        output_cost = (output_tokens / 1000) * 0.002
        return input_cost + output_cost

    def track_usage(self, prompt, response):
        input_tokens = self.count_tokens(prompt)
        output_tokens = self.count_tokens(response)
        cost = self.calculate_cost(input_tokens, output_tokens)

        self.total_tokens += input_tokens + output_tokens
        self.total_cost += cost

        return {
            'input_tokens': input_tokens,
            'output_tokens': output_tokens,
            'cost': cost,
            'total_cost': self.total_cost
        }

# Initialize OpenAI client and tracker
client = OpenAI(api_key=settings.OPENAI_API_KEY)
usage_tracker = APIUsageTracker()

def text_generator_view(request):
    return render(request, 'text_improver/text_generator.html')  # Updated template path

def generate_text(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            prompt = data.get('prompt', '')
            prompt_type = data.get('type', 'email')
            tone = data.get('tone', 'professional')

            system_message = f"You are a professional {prompt_type} writer. Write in a {tone} tone."
            full_prompt = f"{system_message}\n\n{prompt}"

            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": system_message},
                    {"role": "user", "content": prompt}
                ],
                max_tokens=1000,
                temperature=0.7
            )

            generated_text = response.choices[0].message.content
            usage_stats = usage_tracker.track_usage(full_prompt, generated_text)

            return JsonResponse({
                'generated_text': generated_text,
                'type': prompt_type,
                'usage': {
                    'input_tokens': usage_stats['input_tokens'],
                    'output_tokens': usage_stats['output_tokens'],
                    'total_tokens': usage_stats['input_tokens'] + usage_stats['output_tokens'],
                    'estimated_cost_usd': round(usage_stats['cost'], 5),
                    'total_cost_usd': round(usage_stats['total_cost'], 5)
                }
            })

        except Exception as e:
            print(f"Error in generate_text: {str(e)}")
            return JsonResponse({'error': str(e)}, status=400)

    return JsonResponse({'error': 'Invalid request method'}, status=405)
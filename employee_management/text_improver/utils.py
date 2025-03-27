def calculate_cost(input_tokens, output_tokens, model="gpt-3.5-turbo"):
    """Calculate the cost of API usage"""
    costs = {
        "gpt-3.5-turbo": {
            "input": 0.0015,  # per 1K tokens
            "output": 0.002  # per 1K tokens
        }
    }

    model_costs = costs.get(model, costs["gpt-3.5-turbo"])
    input_cost = (input_tokens / 1000) * model_costs["input"]
    output_cost = (output_tokens / 1000) * model_costs["output"]

    return input_cost + output_cost
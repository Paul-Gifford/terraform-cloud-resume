resource "aws_lambda_function" "visitor_counter" {
  function_name = "visitor-counter"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
}

resource "aws_lambda_function_url" "visitor_counter_url" {
  function_name      = aws_lambda_function.visitor_counter.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = false
    allow_origins     = ["https://paul-giff.com"]
    allow_methods     = ["GET", "POST"]
    allow_headers     = ["content-type"]
    max_age           = 86400
  }
}
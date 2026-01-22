resource "aws_lambda_function" "this" {
  function_name = "example-lambda"
  role          = var.iam_role
  runtime       = "python3.11"
  handler       = "handler.lambda_handler"
  timeout       = 10

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
}
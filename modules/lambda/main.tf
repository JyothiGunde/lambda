data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.root}/lambda_src/handler.py"
  output_path = "${path.root}/lambda.zip"
}

resource "aws_lambda_function" "this" {
  function_name = "example-lambda"
  role          = var.iam_role
  runtime       = "python3.11"
  handler       = "handler.lambda_handler"
  timeout       = 10

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}

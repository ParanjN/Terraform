##### INCOMPLETE ##############

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  function_name = "test_lambda_function"
  role          = var.iam_role_lambda
  handler       = "app.py"
  s3_bucket = ""
  s3_key = ""
  runtime = "python3.8"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
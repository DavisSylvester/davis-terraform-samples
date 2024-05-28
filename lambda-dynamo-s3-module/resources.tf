## ADD Client CONFIGURATION LAMBDA
resource "aws_lambda_function" "aws_lds_lambda" {
  function_name    = "${var.lds_app_prefix}-${var.lds_lambda_name}"
  filename         = local.lds_lambda_zip_file
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role    = aws_iam_role.lambda_role.arn
  handler = var.lds_lambda_handler
  runtime = var.lds_lambda_runtime

  environment {
    variables = {

    }
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.lds_source_code_release_directory
  output_path = "./${local.lds_lambda_zip_file}"
}

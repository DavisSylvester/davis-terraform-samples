locals {
  lds_lambda_zip_file   = "lds_lambda_artifact.zip"
  lds_app_lambda_prefix = "${var.lds_app_prefix}-${var.lds_lambda_name}"
}

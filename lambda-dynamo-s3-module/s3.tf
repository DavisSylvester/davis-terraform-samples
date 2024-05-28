resource "aws_s3_bucket" "base_artifacts_bucket" {
  bucket = "${var.lds_app_prefix}-${var.lds_bucket_name}"
}

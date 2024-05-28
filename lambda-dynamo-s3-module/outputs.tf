output "dynamo_table_name" {
  value = aws_dynamodb_table.lds_database.name
}

output "dynamo_table_arn" {
  value = aws_dynamodb_table.lds_database.id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.base_artifacts_bucket.bucket
}

output "lambda_name" {
  value = aws_lambda_function.aws_lds_lambda.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.aws_lds_lambda.arn
}

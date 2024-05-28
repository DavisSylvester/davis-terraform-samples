data "aws_caller_identity" "current" {}

output "account_number" {
  value = data.aws_caller_identity.current.account_id
}

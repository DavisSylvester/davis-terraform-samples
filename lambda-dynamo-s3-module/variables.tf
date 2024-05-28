variable "lds_app_prefix" {
  description = "The prefix for the application"
  type        = string

}

variable "lds_lambda_name" {
  type = string
}

variable "lds_lambda_handler" {
  type = string
}

variable "lds_lambda_runtime" {
  type    = string
  default = "dotnet6"

}

variable "lds_source_code_release_directory" {
  type        = string
  description = "The directory where the source code is located (generally your release directory)"
}

variable "lds_bucket_name" {
  type = string
  description = "Bucket name to store files your application generates or needs"
}

variable "lds_database_name" {
  type = string
  description = "DynamoDb Datbase Name"
}

variable "region" {
  type = string
  description = "AWS Region"
}

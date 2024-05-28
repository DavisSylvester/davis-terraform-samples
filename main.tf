terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "dsylvesteriii"
}

module "LambdaDynamoS3" {
  source                            = "./lambda-dynamo-s3-module"
  lds_app_prefix                    = "davis-titan"
  region                            = "us-east-1"
  lds_lambda_name                   = "random-number"
  lds_lambda_handler                = "ContactGenerator::ContactGeneratorLib::GenerateData"
  lds_source_code_release_directory = "C:\\projects\\davis\\contact-demo\\contact.generator.demo\\ContactGenerator\\bin\\Release\\net6.0"
  lds_bucket_name                   = "uploaded-images"
  lds_database_name                 = "random-number"


}

resource "aws_iam_role" "lambda_role" {
  name               = "${local.lds_app_lambda_prefix}-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "lambda.amazonaws.com"
      },
        "Effect": "Allow",
        "Sid": ""
    }   
  ]
}
EOF
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = "${local.lds_app_lambda_prefix}-policy"
  description = "Policy for Lambda to access DynamoDB and CloudWatch Logs"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Action": [
            "dynamodb:BatchGetItem",
            "dynamodb:ConditionCheckItem",
            "dynamodb:DescribeTable",
            "dynamodb:GetItem",
            "dynamodb:GetRecords",
            "dynamodb:GetShardIterator",
            "dynamodb:Query",
            "dynamodb:Scan"
            ],
        "Resource": [
                "arn:aws:dynamodb:${var.region}:${data.aws_caller_identity.current.account_id}:table/${local.lds_app_lambda_prefix}-${var.lds_database_name}",
                "arn:aws:dynamodb:${var.region}:${data.aws_caller_identity.current.account_id}:table/${local.lds_app_lambda_prefix}-${var.lds_database_name}/*"
            ],
        "Effect": "Allow"
    },
    {
        "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
        "Effect": "Allow",            
        "Resource": "arn:aws:logs:*:*:*"
    },
    {
        "Action": [
                "s3:DeleteObject*",
                "s3:GetBucket*",
                "s3:List*",
                "s3:PutBucketPolicy"
            ],
        "Effect": "Allow",
        "Resource": [
            "arn:aws:s3:::${var.lds_app_prefix}-${var.lds_bucket_name}",
            "arn:aws:s3:::${var.lds_app_prefix}-${var.lds_bucket_name}/*"
        ]
    }

  ]
} 
EOF
}


resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
  role       = aws_iam_role.lambda_role.name
}

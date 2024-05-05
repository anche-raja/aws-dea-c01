provider "aws" {
  region = "us-east-1" # Update with your desired AWS region
}

# Create Kinesis Data Stream
resource "aws_kinesis_stream" "my_stream" {
  name        = "my-kinesis-stream"
  shard_count = 2
}

# IAM Role for Python Lambda function
resource "aws_iam_role" "kinesis_lambda_role" {
  name = "kinesis-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Policy for Python Lambda function
resource "aws_iam_policy" "kinesis_lambda_policy" {
  name        = "kinesis-lambda-policy"
  description = "Policy for Kinesis Lambda function"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "kinesis:PutRecord",
      "Resource": "${aws_kinesis_stream.my_stream.arn}"
    }
  ]
}
EOF
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "kinesis_lambda_attachment" {
  role       = aws_iam_role.kinesis_lambda_role.name
  policy_arn = aws_iam_policy.kinesis_lambda_policy.arn
}

# Lambda Function for ingesting data into Kinesis
resource "aws_lambda_function" "kinesis_ingest_lambda" {
  filename      = "kinesis_ingest_lambda.zip"
  function_name = "kinesis_ingest_lambda"
  role          = aws_iam_role.kinesis_lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
}

# CloudWatch Event Rule to trigger Lambda periodically
resource "aws_cloudwatch_event_rule" "kinesis_ingest_trigger" {
  name                = "kinesis_ingest_trigger"
  schedule_expression = "rate(1 minute)" # Adjust as needed

  depends_on = [aws_lambda_function.kinesis_ingest_lambda]
}

resource "aws_cloudwatch_event_target" "kinesis_ingest_lambda_target" {
  rule      = aws_cloudwatch_event_rule.kinesis_ingest_trigger.name
  target_id = "kinesis_ingest_lambda_target"
  arn       = aws_lambda_function.kinesis_ingest_lambda.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_invoke" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.kinesis_ingest_lambda.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.kinesis_ingest_trigger.arn
}

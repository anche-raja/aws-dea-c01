# first init plan apply cycle 
# Comment after creating backend S3 bucket.
provider "aws" {

  region  = "us-east-1"
}

resource "aws_s3_bucket" "terraform_remote_state" {
  bucket = "tf-state-ancher"
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "terraform-remote-state"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "tf-state-g1rxa02-gen-ai" {
  name = "tf-state-ancher"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}
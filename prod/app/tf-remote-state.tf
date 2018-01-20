# Default region
#
provider "aws" {
  region = "eu-west-1"
}

# Configure terraform to use the remote state file
#
terraform {
 backend "s3" {
  encrypt = true
  bucket = "spoofedpacket-tf-remote-state-storage-s3"
  dynamodb_table = "tf-moodle-prod-app-state-lock-dynamo"
  region = "eu-west-1"
  key = "tf-moodle-prod-app.tfstate"
 }
}

# Create a dynamodb table for locking the state file
#
resource "aws_dynamodb_table" "tf-moodle-prod-app-state-lock" {
  name = "tf-moodle-prod-app-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

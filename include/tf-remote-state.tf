terraform {
 backend "s3" {
  encrypt = true
  bucket = "spoofedpacket-tf-remote-state-storage-s3"
  dynamodb_table = "spoofedpacket-tf-state-lock-dynamo"
  region = "eu-west-1"
  key = "terraform.tfstate"
 }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "moodle-tf-lb" {
  name = "example-moodle-tf-lb"

  # Inbound HTTP from anywhere
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Inbound HTTPS from anywhere
  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

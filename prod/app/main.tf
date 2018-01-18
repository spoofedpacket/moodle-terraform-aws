resource "aws_instance" "example-moodle-web1" {
  # Ubuntu Server 16.04 LTS (HVM), SSD Volume Type in eu-west-1
  ami = "ami-8fd760f6"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "80" &
              EOF

  tags {
    Name = "moodle-terraform-aws"
  }
}


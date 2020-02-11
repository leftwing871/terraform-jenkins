provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "jenkins" {
  ami           = "ami-04820fb919c13eb62"
  instance_type = "t2.medium"

  subnet_id = aws_subnet.private.0.id
  vpc_security_group_ids = [aws_security_group.jenkins.id]

  provisioner "local-exec" {
    command = "echo ${aws_instance.jenkins.public_ip} > ip_address.txt"
  }

  depends_on = [aws_security_group.jenkins]
}


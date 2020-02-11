resource "aws_security_group" "ssh" {
  name = "allow_ssh_from_all"
  description = "Allow SSH port from all"


# vpc_id = var.vpc_id
  vpc_id = local.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # depends_on = [aws_subnet.private]
}

resource "aws_security_group" "jenkins" {
  name = "jenkins"
  description = "for jenkins"

  vpc_id = local.vpc_id

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_groups = [aws_security_group.alb.id]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # depends_on = [aws_subnet.private]
}


resource "aws_security_group" "alb" {
  name = "alb"
  description = "for jenkins"

  vpc_id = local.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # depends_on = [aws_subnet.private]
}
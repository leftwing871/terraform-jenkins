resource "aws_lb_target_group" "jenkins" {
  name = "jenkins"
  port = 80
  protocol = "HTTP"
  vpc_id = local.vpc_id
  health_check {
    interval = 10
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    protocol = "HTTP"
    path = "/whoAmI"
    matcher = "200,302"
  }
}

resource "aws_lb_target_group_attachment" "jenkins" {
  target_group_arn = aws_lb_target_group.jenkins.arn
  target_id = aws_instance.jenkins.id
 
}

resource "aws_lb" "jenkins" {
  name = "jenkins"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb.id]
  subnets = aws_subnet.public[*].id
  
}

resource "aws_lb_listener" "jenkins" {
  load_balancer_arn = aws_lb.jenkins.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }
}
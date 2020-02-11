output "id" {
  value = aws_instance.jenkins.*.id
}

output "vpc_id" {
  value = aws_vpc.this.*.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "nat_gateway_ip" {
  value = aws_eip.private.*.public_ip
}

output "jenkins_instance_private_ip" {
  value = aws_instance.jenkins.private_ip
}

output "application_load_balancer_dns_name"{
  value = aws_lb.jenkins.dns_name
}
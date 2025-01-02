output "vpc_id" {
  value = aws_vpc.Final-Project.id
}

output "subnet_id" {
  value = aws_subnet.Final-Project.id
}

output "instance_ip" {
  value = aws_instance.Final-Project.public_ip
}

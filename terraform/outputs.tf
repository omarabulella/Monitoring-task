output "prometheus_ec2_public_ip" {
  value = aws_instance.prometheus_ec2.public_ip
}
output "App_ec2_public_ip" {
  value = aws_instance.App_ec2.public_ip
}
output "infra_ec2_public_ip" {
  value = aws_instance.infra_ec2.public_ip
}
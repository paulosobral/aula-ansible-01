output "dns_name" {
  value = aws_instance.server.public_dns
}
output "server_ip_public" {
  value = aws_instance.server.public_ip
}
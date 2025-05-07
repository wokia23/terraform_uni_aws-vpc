output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.univpc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.univpc.arn
}

output "dhcp_options_id" {
  description = "The ID of the DHCP options set associated with the VPC"
  value       = aws_vpc.univpc.dhcp_options_id
}
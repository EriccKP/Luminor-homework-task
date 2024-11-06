output "private_subnet_id" {
  description = "The ID of the first private subnet"
  value       = aws_subnet.private.id
}

output "public_subnet_id" {
  description = "The ID of the second private subnet"
  value       = aws_subnet.public.id
}
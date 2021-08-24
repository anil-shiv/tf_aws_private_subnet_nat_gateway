output "subnet_ids" {
  description = "List of private subnet ids"
  value = aws_subnet.private.*.id
}

output "private_route_table_ids" {
  description = "List of route tables ids"
  value = aws_route_table.private.*.id
}
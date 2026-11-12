output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_a_id" {
  value = aws_subnet.a.id
}

output "subnet_b_id" {
  value = aws_subnet.b.id
}

output "bastion_sg_id" { value = aws_security_group.bastion.id }

output "nodes_sg_id"   { value = aws_security_group.nodes.id }
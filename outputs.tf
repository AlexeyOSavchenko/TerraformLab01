output "vpc" {
  value = [
    for v in data.aws_vpc.my_vpc:
    "${v.id} ${v.cidr_block}"
  ]
}

output "subnets" {
  value = [
    for s in data.aws_subnet.my_subnet:
    "${s.id} ${s.cidr_block} ${s.vpc_id}"
  ]
}

output "sgs" {
  value = [
    for g in data.aws_security_group.my_sg:
    "${g.name} ${g.id} ${g.vpc_id}"
  ]
}
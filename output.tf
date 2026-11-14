output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_a_id" {
  value = module.network.subnet_a_id
}

output "subnet_b_id" {
  value = module.network.subnet_b_id
}

output "master_public_ip" {
  value = module.master.public_ip
}

output "worker_1_public_ip" {
  value = module.worker_1.public_ip
}

output "worker_2_public_ip" {
  value = module.worker_2.public_ip
}

output "bastion_public_ip" { value = module.bastion.public_ip }

output "master_private_ip" { value = module.master.private_ip }

output "worker_1_private_ip" { value = module.worker_1.private_ip }

output "worker_2_private_ip" { value = module.worker_2.private_ip }
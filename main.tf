data "aws_ami" "ubuntu" {
  count       = var.ami_id == "" ? 1 : 0
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  selected_ami = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu[0].id
}

module "network" {
  source = "./modules/network"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  subnet_a_cidr       = var.subnet_a_cidr
  subnet_b_cidr       = var.subnet_b_cidr
  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b
   ssh_allowed_cidr = var.ssh_allowed_cidr
}


module "master" {
  source = "./modules/ec2"

  ami_id            = local.selected_ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.network.subnet_a_id
  security_group_id = module.network.nodes_sg_id
  instance_name     = "Master-Control-Plane"
}

module "worker_1" {
  source = "./modules/ec2"

  ami_id            = local.selected_ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.network.subnet_a_id
  security_group_id = module.network.nodes_sg_id
  instance_name     = "Worker-Node-1"
}

module "worker_2" {
  source = "./modules/ec2"

  ami_id            = local.selected_ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.network.subnet_b_id
  security_group_id = module.network.nodes_sg_id
  instance_name     = "Worker-Node-2"
}

module "bastion" {
  source = "./modules/ec2"

  ami_id            = local.selected_ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.network.subnet_a_id
  security_group_id = module.network.bastion_sg_id
  instance_name     = "bastion"
}


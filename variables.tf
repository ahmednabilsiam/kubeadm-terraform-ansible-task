variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = null
}

variable "project_name" {
  type    = string
  default = "k8s-lab"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "availability_zone_a" {
  type    = string
  default = "eu-central-1a"
}

variable "availability_zone_b" {
  type    = string
  default = "eu-central-1b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Existing EC2 key pair"
  type        = string
  default     = "docker-task-key"
}

variable "ssh_allowed_cidr" {
  description = "Your public IP for SSH"
  type        = string
}

variable "ami_id" {
  description = "Optional Ubuntu AMI ID"
  type        = string
  default     = ""
}
terraform {
  backend "s3" {
    bucket       = "ahmednabil-k8s-tfstate"
    key          = "k8s-lab/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }
}
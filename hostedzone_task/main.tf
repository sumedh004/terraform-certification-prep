variable "main_region" {
  type    = string
  default = "us-east-1"
}



variable "name" {
  type        = string
  description = "Enter name for hosted zone"
}

provider "aws" {
  region = var.main_region
}

module "hostedzone" {
  source = "./modules/hostedzone"
  name   = var.name
}


provider "aws" {
  region = var.main_region
}

module "hostedzone" {
  source = "./modules/hostedzone"
  name   = var.name
}


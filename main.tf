module "vpc" {
  source = "./modules/network/vpc"

  vpc-name       = var.vpc-name
  private-subnet = var.private-subnet
  public-subnet  = var.public-subnet
}

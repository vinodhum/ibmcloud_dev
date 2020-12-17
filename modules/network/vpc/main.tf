
locals {
  private-zone = keys(var.private-subnet)
  private-ips    = values(var.private-subnet)
  public-zone = keys(var.public-subnet)
  public-ips    = values(var.public-subnet)
}

# create vpc
resource "ibm_is_vpc" "dev-vpc" {
  name                      = var.vpc-name
  address_prefix_management = "auto"
}


# create private subnet
resource "ibm_is_subnet" "private-subnet" {
  count = length(var.private-subnet)
  name                     = "private-subnet-${count.index + 1}"
  vpc                      = ibm_is_vpc.dev-vpc.id
  zone                     = local.private-zone[count.index]
  total_ipv4_address_count = local.private-ips[count.index]
}

# create public subnet
resource "ibm_is_subnet" "public-subnet" {
  count = length(var.public-subnet)
  name                     = "public-subnet-${count.index + 1}"
  vpc                      = ibm_is_vpc.dev-vpc.id
  zone                     = local.public-zone[count.index]
  total_ipv4_address_count = local.public-ips[count.index]
}


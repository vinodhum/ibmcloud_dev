variable vpc-name {}
variable resource-group {}
variable region {}
variable private-subnet {
  type = map
  default = {
    "us-south-1" = "256"
    "us-south-2" = "256"
    "us-south-3" = "256"
  }
}
variable public-subnet {
  type = map
  default = {
    "us-south-1" = "256"
    "us-south-2" = "256"
    "us-south-3" = "256"
  }
}

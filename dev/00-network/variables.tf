variable "rg_name" {}
variable "location" {}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "vnet_name" {}
variable "vnet_cidr" {}

variable "subnets" {
  type = map(object({
    cidr = string
  }))
}
variable "name" {
  default = "public"
}

variable "cidrs" {
  description = "List of VPC CIDR blocks"
  type = list(string)
  default = []
}

variable "azs" {
  description = "A list of avalability zones"
  type = list(string)
  default = [  ]
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnet_ids" {
  description = "A List of public subnet that will be routed to NAT Gateway"
  type = list(string)
  default = []
}

variable "nat_gateway_ids" {
  description = "A List of NAT gateway in public subnet that will be used in routing"
  type = list(string)
  default = []
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default = false
}

variable "env" {
  description = "Logical environment as it relate to the organization software release lifecycle (eg. DEV, Stage, Prod)"
}

variable "business_unit" {
    description = "Business unit within organization (e.g. Consumer)"
}

variable "app_tag" {
    description = "APP tag eg. Plateform, DevOps"
}

variable "managed_by" {
    description = "Managed by eg. Plateform, DevOps"
}

variable "tier" {
  description = "Tier as it relates to vpc it belongs to (eg. dmz, app, db)"
  type = string
}

variable "data_classification" {
  description = "Data classification as it relates to security compliance (eg. Standard, Sensitive)"
}
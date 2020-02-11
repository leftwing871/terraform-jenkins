variable "region" {
  default = "ap-northeast-2"
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.10.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  # default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {
    "kk": "value",
    "jj": "Value"
  }
}

variable "public_subnets" {
  # type = list(object({
  #   name = string
  #   zone = string
  #   cidr = string
  #   tags = map
  # }))
  default = [
    {
      # name = "${var.name}-public-a"
      # zone = "${var.region}a"
      name = "xxx-public-a"
      zone = "ap-northeast-2a"
      cidr = "10.10.1.0/24"
      tags = {
        "ps1": "value",
        "ps2": "Value"
      }
    },
    {
      name = "xxx-public-b"
      zone = "ap-northeast-2b"
      cidr = "10.10.2.0/24"
      tags = {
        "ps1": "value",
        "ps2": "Value"
      }
    },
    {
      name = "xxx-public-c"
      zone = "ap-northeast-2c"
      cidr = "10.10.3.0/24"
      tags = {
        "ps1": "value",
        "ps2": "Value"
      }
    },
  ]
}

variable "private_subnets" {
  # type = list(object({
  #   name = string
  #   zone = string
  #   cidr = string
  #   tags = map
  # }))
  default = [
    {
      name = "xxx-private-a"
      zone = "ap-northeast-2a"
      cidr = "10.10.4.0/24"
      tags = {
        "psp1": "value",
        "psp2": "Value"
      }
    },
    {
      name = "xxx-private-b"
      zone = "ap-northeast-2b"
      cidr = "10.10.5.0/24"
      tags = {
        "psp1": "value",
        "psp2": "Value"
      }
    },
    {
      name = "xxx-private-c"
      zone = "ap-northeast-2c"
      cidr = "10.10.6.0/24"
      tags = {
        "psp1": "value",
        "psp2": "Value"
      }
    },
  ]
}

variable "single_route_table" {
  description = "Should be true if you want to provision a single shared Route Table across all of your public networks"
  type        = bool
  default     = false
}


variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

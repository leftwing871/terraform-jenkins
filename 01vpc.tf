resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block = var.vpc_cidr

  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      Name = format("%s", var.name)
    },
    var.tags,
  )
}

resource "aws_internet_gateway" "this" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = local.vpc_id

  tags = merge(
    {
      Name = format("%s", var.name)
    },
    var.tags,
  )
}

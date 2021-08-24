#Subnet
resource "aws_subnet" "private" {
  vpc_id = var.vpc_id
  cidr_block = element(var.cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  count = length(var.cidrs)
  map_public_ip_on_launch = var.map_public_ip_on_launch

  lifecycle {
      create_before_destroy = true
  }

  tags = {
      BusinessUnit = var.business_unit
      Name = "${var.name}.${element(var.azs, count.index)}"
      App = var.app_tag
      ManagedBy = var.managed_by
      Environment = var.env
      Role = "Private Subnet"
      Provisioner = "Terraform"
      DataClassification = var.data_classification
      Tier = var.tier
    }
}

#Routes
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  count = length(var.cidrs)

  tags = {
      BusinessUnit = var.business_unit
      Name = "${var.name}.${element(var.azs, count.index)}"
      App = var.app_tag
      ManagedBy = var.managed_by
      Environment = var.env
      Role = "Private Route Table"
      Provisioner = "Terraform"
    }
}

resource "aws_route_table_association" "private" {
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
  count = length(var.cidrs)

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_route" "nat_gateway" {
  route_table_id = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = element(var.nat_gateway_id, count.index)
  count = length(var.cidrs)

  depends_on = [
      aws_route_table.private
  ]

  lifecycle {
      create_before_destroy = true
  }
}
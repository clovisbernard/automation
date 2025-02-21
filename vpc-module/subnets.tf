# Create two public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr_block[0]
  availability_zone       = var.availability_zone[0]
  map_public_ip_on_launch = true
 tags = merge(var.common_tags, {
    Name   = format("%s-%s-%s-public_subnet_1", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"   
    },
  )
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr_block[1]
  availability_zone       = var.availability_zone[1]
  map_public_ip_on_launch = true
 tags = merge(var.common_tags, {
    Name   = format("%s-%s-%s-public_subnet_2", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    },
  )
}

# Create two private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr_block[2]
  availability_zone       = var.availability_zone[0]
 tags = merge(var.common_tags, {
    Name   = format("%s-%s-%s-private_subnet_1", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    },
  )
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block              = var.subnets_cidr_block[3]
  availability_zone       = var.availability_zone[1]
 tags = merge(var.common_tags, {
    Name   = format("%s-%s-%s-private_subnet_2", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"  
    },
  )
}
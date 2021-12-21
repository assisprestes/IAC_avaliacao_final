# Route Table to Private Subnet
resource "aws_route_table" "private_route_table" {
    vpc_id = "${aws_vpc.vpc_elb.id}"
 
    tags = {
        Name = "Private Route Table"
    }
}

# Private Route to Internet 
resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.private_route_table.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.nat.id}"
}

# Private Subnet 1
resource "aws_subnet" "private_1_subnet_us_east_1a" {
  vpc_id                  = "${aws_vpc.vpc_elb.id}"
  cidr_block              = "172.31.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
  	Name =  "Private Subnet 1"
  }
}

# Associate subnet private_1_subnet_us_east_1a to private route table
resource "aws_route_table_association" "pr_1_subnet_us_east_1a_association" {
    subnet_id = "${aws_subnet.private_1_subnet_us_east_1a.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

# Private Subnet 2
resource "aws_subnet" "private_2_subnet_us_east_1b" {
  vpc_id                  = "${aws_vpc.vpc_elb.id}"
  cidr_block              = "172.31.5.0/24"
  availability_zone = "us-east-1b"
  tags = {
  	Name =  "Private Subnet 2"
  }
}

# Associate subnet private_2_subnet_us_east_1a to private route table
resource "aws_route_table_association" "pr_2_subnet_us_east_1b_association" {
    subnet_id = "${aws_subnet.private_2_subnet_us_east_1b.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}





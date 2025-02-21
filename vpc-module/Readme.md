Select region: us-east-1
Create a vpc with an IPv4 CIDR block
Create two internet gateway attach to the VPC.
Create 02 availabillities zones:us-east-1a,us-east-1b
Create two private subnets and two public sunets
Allocate Elastic IPs for NAT Gateways
Create two public NAT gateway in the public subnets and associate a elastic IPs address with the NAT gateway at creation
Create two route tables with destination 0.0.0.0/0 and NAT Gatways as target
Create two route tables with destination 0.0.0.0/0 and internet Gateway as target
Create two routes table association that associate each public subnet to each public subnet
Create two routes table association that associate each private subnet to each private subnet
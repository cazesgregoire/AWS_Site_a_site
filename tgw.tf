 resource "aws_ec2_transit_gateway" "main" {
   description     = "vpn"
   amazon_side_asn = 64512

   tags = {
     Name = "vpn-tgw"
   }
 }

 resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
   subnet_ids         = aws_subnet.public[*].id
   transit_gateway_id = aws_ec2_transit_gateway.main.id
   vpc_id             = aws_vpc.main.id
}

 resource "aws_ec2_transit_gateway_route_table" "vpn" {
   transit_gateway_id = aws_ec2_transit_gateway.main.id
 }

 resource "aws_ec2_transit_gateway_route" "onprem" {
   destination_cidr_block         = var.OnPremCIDR
   transit_gateway_attachment_id  = aws_vpn_connection.vpn.transit_gateway_attachment_id
   transit_gateway_route_table_id = aws_ec2_transit_gateway.main.association_default_route_table_id

   depends_on = [aws_ec2_transit_gateway_route_table.vpn]
}
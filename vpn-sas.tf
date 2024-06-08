## VPN Site à Site ##

resource "aws_customer_gateway" "sophos" {
  bgp_asn    = 65001
  ip_address = "82.66.170.70"
  type       = "ipsec.1"

  tags = {
    Name = "VPN_Custumer_Gateway_Sophos"
  }
}

resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = aws_customer_gateway.sophos.id
  transit_gateway_id  = aws_ec2_transit_gateway.main.id
  type                = "ipsec.1"

  tags = {
    Name = "Site_a_Site_Sophos"
  }
}

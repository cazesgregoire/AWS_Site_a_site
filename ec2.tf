resource "aws_instance" "linux" {
  ami                  = "ami-04fe22dfadec6f0b6"
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.private[0].id
  iam_instance_profile = aws_iam_instance_profile.ssm-allow.name
  security_groups      = [aws_security_group.imcp.id]
  user_data            = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF


  tags = {
    Name = var.tag_name
  }
}

resource "aws_instance" "name" {
  ami                  = "ami-04fe22dfadec6f0b6"
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.private[0].id
  iam_instance_profile = aws_iam_instance_profile.ssm-allow.name
  security_groups      = [aws_security_group.imcp.id]

  tags = {
    Name = "test_ping"
  }

}

/*
resource "aws_instance" "nat" {
  ami                         = var.amiIdNat
  instance_type               = var.InstanceType
  subnet_id                   = aws_subnet.public[0].id
  source_dest_check           = false
  associate_public_ip_address = true


  tags = {
    Name = "NAT-INSTANCE"
  }
}*/
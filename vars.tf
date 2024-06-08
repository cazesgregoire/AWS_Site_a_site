variable "VpcName" {
  default     = "MyTerraformVPC"
  type        = string
  description = "Name of VPC created by Terraform"
}

variable "VpcCidr" {}
variable "PublicSubnetName" {}
variable "PublicSubnetCidr" {}
variable "PrivateSubnetName" {}
variable "PrivateSubnetCidr" {}
variable "CidrInternet" {}
variable "PublicRTName" {}
variable "PrivateRTName" {}
variable "IGWName" {}
variable "NGWName" {}
variable "InstanceType" {}
variable "InstanceName" {}
variable "AmiId" {}
variable "instance_type" {}
variable "tag_name" {}
variable "amiIdNat" {}
variable "OnPremCIDR" {}
variable "AWS_VPC" {}


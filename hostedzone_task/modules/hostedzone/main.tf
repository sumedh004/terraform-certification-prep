provider "aws" {

region = var.region
}

resource "aws_vpc" "primary" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "VPC1"
  }
}

resource "aws_vpc" "secondary" {
  cidr_block           = "20.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "VPC2"
  }
}
resource "aws_route53_zone" "private" {
  name = var.name

  vpc {
    vpc_id = aws_vpc.primary.id
  }


  vpc {
    vpc_id = aws_vpc.secondary.id
  }


}
resource "null_resource" "delete" {

  provisioner "local-exec" {
    command = <<-EOT

	      aws route53 disassociate-vpc-from-hosted-zone --hosted-zone-id ${aws_route53_zone.private.zone_id} --vpc VPCRegion=${var.region},VPCId=${aws_vpc.primary.id}
	      aws ec2 delete-vpc --vpc-id ${aws_vpc.primary.id}
    EOT  

}
   depends_on = [aws_route53_zone.private]
}




module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = "${local.namespace}-vpc"

  azs             = var.azs
  cidr            = var.vpc_cidr_block
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_dns_hostnames         = true
  enable_dns_support           = true
  enable_nat_gateway           = true
  single_nat_gateway           = true
  create_database_subnet_group = false

  tags = local.common_tags
}

module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = [module.vpc.default_security_group_id]

  endpoints = {
    ssm = {
      service         = "ssm"
    },
    ec2 = {
      service         = "ec2"
    },
  }

  tags = local.common_tags
}

module "dns" {
  source = "github.com/infrablocks/terraform-aws-dns-zones"

  domain_name         = local.public_zone_name
  private_domain_name = local.private_zone_name

  # Default VPC
  private_zone_vpc_id     = module.vpc.vpc_id
  private_zone_vpc_region = var.aws_region
}

data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone_name
}

resource "aws_route53_record" "public_zone" {
  zone_id = data.aws_route53_zone.hosted_zone.id
  type    = "NS"
  name    = local.public_zone_name
  records = module.dns.public_zone_name_servers
  ttl     = 300
}


# Variable Passthroughs

output "aws_region" {
  value = var.aws_region
}

output "azs" {
  value = var.azs
}

output "ec2_keyname" {
  value = var.ec2_keyname
}

output "ec2_public_key" {
  value = var.ec2_public_key
}

output "environment" {
  value = var.environment
}

output "hosted_zone_name" {
  value = var.hosted_zone_name
}

output "stack_name" {
  value = var.stack_name
}

output "subnet_config" {
  value = {
    public_subnets  = var.vpc_public_subnets
    private_subnets = var.vpc_private_subnets
  }
}

output "tags" {
  value = var.tags
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

# Security Groups

# output "security_groups" {
#   value = {
#     bastion    = "${aws_security_group.bastion.id}"
#     cache      = "${aws_security_group.redis.id}"
#     db         = "${aws_security_group.db.id}"
#     fcrepo     = "${module.fcrepo_environment.security_group_id}"
#     index      = "${module.solr_environment.security_group_id}"
#     zookeeper  = "${module.zookeeper_environment.security_group_id}"
#   }
# }

# Resource Outputs

# output "application_source_bucket" {
#   value = "${aws_s3_bucket.app_sources.id}"
# }

# output "bastion_address" {
#   value = "${aws_route53_record.bastion.name}"
# }

output "cache_address" {
  value = aws_route53_record.redis.name
}

output "cache_port" {
  value = aws_elasticache_cluster.redis.cache_nodes[0].port
}

# output "zookeeper_address" {
#   value = "zk.${local.private_zone_name}"
# }

# output "zookeeper_port" {
#   value = "2181"
# }

output "db_avalon_address" {
  value = module.db_avalon.db_instance_address
}

output "db_avalon_port" {
  value = module.db_avalon.db_instance_port
}

output "db_avalon_username" {
  sensitive = true
  value = module.db_avalon.db_instance_username
}

output "db_avalon_password" {
  sensitive = true
  value = module.db_avalon.db_instance_password
}

output "db_fcrepo_address" {
  value = module.db_fcrepo.db_instance_address
}

output "db_fcrepo_port" {
  value = module.db_fcrepo.db_instance_port
}

output "db_fcrepo_username" {
  sensitive = true
  value = module.db_fcrepo.db_instance_username
}

output "db_fcrepo_password" {
  sensitive = true
  value = module.db_fcrepo.db_instance_password
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "private_zone_id" {
  value = module.dns.private_zone_id
}

output "public_ip" {
  value = aws_instance.compose.public_ip
}

output "public_zone_name" {
  value = local.public_zone_name
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_zone_id" {
  value = module.dns.public_zone_id
}

# output "repo_endpoint" {
#   value = "http://${aws_route53_record.fcrepo.name}/rest"
# }
# 
# output "send_email_policy_arn" {
#   value = "${aws_iam_policy.send_email.arn}"
# }

output "vpc_id" {
  value = module.vpc.vpc_id
}


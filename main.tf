resource "aws_elasticsearch_domain" "es" {
  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "es:*",
    "Principal": "*",
    "Effect": "Allow",
    "Condition": {
      "IpAddress": {
        "aws:SourceIp": []
      }
    }
  }]
}
CONFIG

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  cluster_config = {
    instance_type  = "${var.instance_type}"
    instance_count = "${var.instance_count}"
  }

  domain_name = "${var.domain_name}"

  ebs_options = {
    ebs_enabled = "${var.ebs_enabled}"
    volume_size = "${var.ebs_volume_size}"
    volume_type = "${var.ebs_volume_type}"
  }

  elasticsearch_version = "${var.elasticsearch_version}"

  lifecycle {
    ignore_changes = ["access_policies"]
  }
}

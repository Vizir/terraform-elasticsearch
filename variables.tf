variable "domain_name" {}

variable "ebs_enabled" {
  description = "Enable additional storage despite the one that comes with the instance type"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
}

variable "ebs_volume_type" {
  description = "The volume type according to AWS EBS API"
}

variable "elasticsearch_version" {}

variable "instance_count" {}

variable "instance_type" {}

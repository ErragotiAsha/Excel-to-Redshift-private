variable "region" {
  default = "ap-south-1"
}

variable "cluster_identifier" {
  default = "my-redshift-cluster"
}

variable "master_username" {
  default = "admin"
}

variable "master_password" {
  description = "Redshift master password"
  sensitive   = true
}


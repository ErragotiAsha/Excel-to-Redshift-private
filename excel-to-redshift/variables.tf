variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name prefix"
  default     = "excel-to-redshift"
}

variable "my_ip_cidr" {
  description = "for Redshift access"
  default     = "223.185.46.101/32"
}

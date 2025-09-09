# Redshift Subnet Group
resource "aws_redshift_subnet_group" "redshift_subnet" {
  name       = "${var.project}-subnet-group"
  subnet_ids = data.aws_subnets.default.ids
}

# Default VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security Group for Redshift
resource "aws_security_group" "redshift_sg" {
  name   = "${var.project}-sg"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]   # restrict access to your IP or internal network
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Redshift Cluster
resource "aws_redshift_cluster" "redshift" {
  cluster_identifier = "${var.project}-cluster"
  node_type          = "ra3.xlplus"
  number_of_nodes    = 1

  master_username = "adminuser"
  master_password = "Str0ngPass!2025"   # ensure this is securely stored in a tfvars file or AWS Secrets Manager

  iam_roles                 = [aws_iam_role.redshift_role.arn]
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet.name
  vpc_security_group_ids    = [aws_security_group.redshift_sg.id]

  publicly_accessible = false   # ✅ Change this to false to make it private
  skip_final_snapshot = true
}

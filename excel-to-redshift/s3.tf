# Fetch AWS account details
data "aws_caller_identity" "current" {}

# S3 bucket for Excel files
resource "aws_s3_bucket" "excel_bucket" {
  bucket = "${var.project}-${data.aws_caller_identity.current.account_id}-bucket"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.excel_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

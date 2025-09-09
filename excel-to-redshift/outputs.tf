output "s3_bucket_name" {
  value = aws_s3_bucket.excel_bucket.bucket
}

output "redshift_endpoint" {
  value = aws_redshift_cluster.redshift.endpoint
}

output "redshift_port" {
  value = aws_redshift_cluster.redshift.port
}

output "redshift_database" {
  value = aws_redshift_cluster.redshift.database_name
}

output "redshift_role_arn" {
  value = aws_iam_role.redshift_role.arn
}

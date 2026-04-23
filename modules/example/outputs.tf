output "module_bucket_name" {
  description = "Bucket name created by the example module"
  value       = aws_s3_bucket.module_example.bucket
}

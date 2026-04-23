resource "aws_s3_bucket" "module_example" {
  bucket = var.bucket_name
  acl    = "private"

  tags = merge(
    var.tags,
    {
      Name        = "module-example-bucket"
      Environment = var.environment
    }
  )
}

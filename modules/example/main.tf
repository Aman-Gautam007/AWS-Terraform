resource "aws_s3_bucket" "module_example" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    {
      Name        = "module-example-bucket"
      Environment = var.environment
    }
  )
}

resource "aws_s3_bucket_acl" "module_example" {
  bucket = aws_s3_bucket.module_example.id
  acl    = "private"
}

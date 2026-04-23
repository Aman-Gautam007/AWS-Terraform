# Example AWS resource
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "example-bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

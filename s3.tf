# Create an S3 Bucket
# Random ID for uniqueness
resource "random_id" "suffix" {
  byte_length = 4
}

# S3 bucket resource
resource "aws_s3_bucket" "example_bucket" {
  bucket = "swiggy-bucket-${random_id.suffix.hex}"   # unique name
}

# Enable versioning (using new resource, not deprecated)
resource "aws_s3_bucket_versioning" "example_versioning" {
  bucket = aws_s3_bucket.example_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


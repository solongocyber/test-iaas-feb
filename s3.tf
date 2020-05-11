resource "aws_s3_bucket" "b" {
  bucket = "test-iaas-bucket2"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
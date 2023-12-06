provider "aws" {
  region = "eu-north-1"
}

provider "random" {}

data "aws_availability_zones" "available" {}

resource "random_pet" "random" {}


resource "aws_s3_bucket" "mybucket" {
  bucket = "my-test-bucket-ercadsdaswq-sdjfksdf-2023dd2d-er"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


# resource "aws_s3_bucket_policy" "mybucketpolicy" {
#   bucket = "${aws_s3_bucket.mybucket.id}"
#   #bucket = "my-test-bucket-ercadsdaswq-sdjfksdf-2023dd2d"
#   policy = <<POLICY
# {
#     "Version":"2012-10-17",
#     "Statement":[
#       {
#         "Sid":"AddPerm",
#         "Effect":"Allow",
#         "Principal": "*",
#         "Action":["s3:GetObject"],
#         "Resource":["arn:aws:s3:::my-test-bucket-ercadsdaswq-sdjfksdf-2023dd2d/*"]
#       }
#     ]
# }
# POLICY
#   # depends_on = [aws_s3_bucket.mybucket]
# }

resource "aws_s3_bucket_public_access_block" "mybucket-bpa" {
  #bucket = "my-test-bucket-ercadsdaswq-sdjfksdf-2023dd2d"
  bucket = "${aws_s3_bucket.mybucket.id}"
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}
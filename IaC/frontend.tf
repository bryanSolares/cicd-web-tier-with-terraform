resource "aws_s3_bucket" "frontend" {
  bucket = "my-application-frontend-dev"

  tags = {
    Name        = "my-application-frontend-dev"
    Environment = "development-stage"
  }

}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = "my-application-frontend-dev"
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

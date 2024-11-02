resource "aws_s3_bucket" "frontend" {
  bucket = "my-application-frontend-${var.stage}"

  tags = {
    Name        = "my-application-frontend-${var.stage}"
    Environment = "${var.stage}"
  }

}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = "my-application-frontend-${var.stage}"
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

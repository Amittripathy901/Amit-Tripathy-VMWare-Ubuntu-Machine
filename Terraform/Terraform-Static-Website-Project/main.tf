terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

#This block specifies the required providers for the Terraform configuration. It declares that we'll be using the AWS provider (version 5.72.0) and the random provider (version 3.6.3).

provider "aws" {
  region = "ap-south-1"
} #This sets up the AWS provider and specifies that we'll be working in the "ap-south-1" region 

resource "random_id" "rand_id" {
  byte_length = 8
} #This creates a random ID with 8 bytes of randomness. It's used to ensure unique naming for resources

resource "aws_s3_bucket" "mywebapp-bucket" {
  bucket = "mywebapp-bucket-${random_id.rand_id.hex}"
} #This creates an S3 bucket. The bucket name includes the random ID we generated earlier to ensure uniqueness.

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mywebapp-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
#This configures the public access settings for the bucket. All settings are set to false, which means public access is allowed.


resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.mywebapp-bucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.mywebapp-bucket.arn}/*"
        }
      ]
    }
  )
}
#This sets the bucket policy. It allows public read access to all objects in the bucket

resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.mywebapp-bucket.id

  index_document {
    suffix = "index.html"
  }
}
#This configures the bucket for static website hosting. It sets "index.html" as the default page.


resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.mywebapp-bucket.bucket
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html" #-->Make it seen as a web page
}                            #This uploads an "index.html" file to the bucket.

resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.mywebapp-bucket.bucket
  source       = "./style.css"
  key          = "style.css"
  content_type = "text/css"
} #This uploads a "styles.css" file to the bucket.
resource "aws_s3_object" "script_js" {
  bucket       = aws_s3_bucket.mywebapp-bucket.bucket
  source       = "./script.js"
  key          = "scriot.js"
  content_type = "application/javascript"
} #This uploads a "script.js" file to the bucket.
resource "aws_s3_object" "resume_pdf" {
  bucket       = aws_s3_bucket.mywebapp-bucket.bucket
  source       = "./Amit Bikram Tripathy-Resume.pdf"
  key          = "resume.pdf"
  content_type = "application/pdf"
} #This uploads a "Resume.pdf" file to the bucket.

output "name" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
} #This defines an output that will display the URL of the S3 website after Terraform applies the configuration.

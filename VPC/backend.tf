terraform {
  backend "s3" {
    bucket = "github-actions-backend-grigorinegru"
    key    = "path/to/my/vpc"
    region = "us-east-1"
  }
}
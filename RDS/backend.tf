terraform {
  backend "s3" {
    bucket = "github-actions-backend-grigorinegru"
    key    = "path/to/my/rds"
    region = "us-east-1"
  }
}
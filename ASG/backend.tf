erraform {
  backend "s3" {
    bucket = "github-actions-backend-grigorinegru"
    key    = "path/to/my/asg"
    region = "us-east-1"
  }
}
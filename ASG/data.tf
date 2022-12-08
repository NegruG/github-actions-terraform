data "terraform_remote_state" "main" {
 backend = "s3"
 config = {
     bucket = "Ygithub-actions-backend-grigorinegru"
     key = "path/to/my/vpc"
     region = "us-east-1"
 }
}


output "full_list" {
 value = data.terraform_remote_state.main.outputs.*
}
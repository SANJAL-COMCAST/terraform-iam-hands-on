terraform {
backend "s3" {
  bucket         = "sl-terraform-remote-state-unique123"
  key            = "iam-demo/terraform.tfstate"
  region         = "eu-north-1"
  dynamodb_table = "terraform-lock-table"
  encrypt        = true
}
}

terraform {
  backend "s3" {
    bucket = "poc-tfstate-files"
    key    = "master.tfstate"
    region = "us-east-2"
  }
}

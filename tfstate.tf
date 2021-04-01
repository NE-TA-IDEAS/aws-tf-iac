terraform {
  backend "s3" {
    bucket = "poc-tfstate-files"
    key    = "master.tfstate"
    region = "us-east-2"
#    access_key = "AKIAU5EHRDAIIOPDWXFZ"
#    secret_key = "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"
  }
}

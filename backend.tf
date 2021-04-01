terraform {
  backend "remote" {
    organization = "iac-sre-poc"

    workspaces {
      name = "tf-iac-dev"
    }
  }
}

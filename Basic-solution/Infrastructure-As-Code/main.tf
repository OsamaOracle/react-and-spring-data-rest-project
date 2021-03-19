
provider "aws" {
  region                  = "${var.region}"
  # shared_credentials_file = "~/.aws/credentials"
  # profile                 = "development"
  shared_credentials_file = "/home/.aws_creds/credentials"
  profile = "terraform-profile"
}


#-------------------------------------- Load File From Bucket ------------------------------------
data "terraform_remote_state" "second_person" {
  backend = "s3" 
  config = {
      bucket = "elad-test15555"
      key    = "dev/elad1/terraform.tfstate"
      region = "eu-central-1"
  }
}


#----------------------------------------------- Latest ami --------------------------------------------
data "aws_ami" "elad_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
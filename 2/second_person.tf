#This File is a Deployment Doc
provider "aws" {
  region     = "eu-west-1"
}
#-------------------------------------- Save File to Bucket ---------------------------------------
terraform {
  backend "s3" {
    bucket = "elad-test15555"
    key = "dev/elad2/terraform.tfstate"
    region = "eu-central-1"
  }
}

#----------------------------------------------- Instance Setting -------------------------------------
resource "aws_instance" "Elad_terraform" {
  count = length(var.list_server)
  ami                          = data.aws_ami.elad_ami.id
  availability_zone            = "eu-west-1b"
  instance_type                = var.instance_type
  vpc_security_group_ids       = [data.terraform_remote_state.second_person.outputs.security_group]
  user_data_replace_on_change = true
  tags = {
     Name = var.list_server[count.index]
  }
#----------------------------------------------- User Data ---------------------------------------------
user_data = file("user_data.sh")
}
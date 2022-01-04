#Declaring AWS Provider and credentials
provider "aws" {
  region     = "us-east-2"
  access_key = "AKIARDDGK2ZKNSO2JLN5"
  secret_key = "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"
}
#######################################################
#Creating Webserver
resource "aws_instance" "webserver" {
 ami = "ami-0fb653ca2d3203ac1"
 instance_type = "t2.micro"
 key_name = var.keyname
 vpc_security_group_ids = [var.linux_security_group]
 subnet_id = var.publicsubnetid
 associate_public_ip_address = "true"
 
 tags = {
  Name = "Webserver"
 }
}
output "Webserver_IP" {
  value = aws_instance.webserver.public_ip
}
output "Webserver_instance_id" {
  value = aws_instance.webserver.id
}
#######################################################
#Creating Application
resource "aws_instance" "application" {
 ami = "ami-0c95aae83dc5a60ac"
 instance_type = "t2.micro"
 key_name = var.keyname
 vpc_security_group_ids = [var.windows_security_group]
 subnet_id = var.privatesubnetid
 
 tags = {
  Name = "application"
 }
}
output "Application_IP" {
  value = aws_instance.application.public_ip
}
output "Application_instance_id" {
  value = aws_instance.application.id
}
########################################################

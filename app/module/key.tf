resource "aws_key_pair" "us-east-1" {
  key_name   = "${var.key_name}"
  public_key =  "${file("~/.ssh/id_rsa.pub")}"
}
data "aws_ami" "image" {
  most_recent = true
  owners      = ["${var.owner}"] 
}

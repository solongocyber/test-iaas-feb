resource "aws_instance" "web" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  key_name     = "${aws_key_pair.us-east-1.key_name}"
  security_groups  = ["${aws_security_group.test-ter.name}"]
  tags = {
    Name = "HelloWorld"
  }
}
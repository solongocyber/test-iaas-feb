data "aws_ami" "centos" {           
  most_recent = true
  owners      = ["679593333241"]   

  filter {                      
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

resource "aws_key_pair" "us-east-1" {
  key_name   = "test_bastion"
  public_key =  "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "centos" {
  ami           = "${data.aws_ami.centos.id}" 
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.us-east-1.key_name}"
provisioner "remote-exec" {
    connection {                          /// Connection block is connecting thrue ssh instance and install and perform task .It called Bootstraping
    type     = "ssh"
    user     = "centos"
    private_key = "${file("~/.ssh/id_rsa")}"       /////file means 
    host     = "${self.public_ip}"   //////find your own ip adress and connect it
  }
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd ",
    ]
  }
}
output "centos" {
  value = "${data.aws_ami.centos.id}"
}
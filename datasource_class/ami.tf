provider "aws" {
  region  = "us-east-1"
  version = "2.59"
}

data "aws_ami" "ubuntu7" { 
most_recent = true    /////find latest one
owners = ["099720109477"] /////ubunmtu centos owner number does not change

} 

//////////////// Ubuntu ///////////////////////
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {                ///Adding filters help more specific 
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}" /// using ami founded in filter block and creating instance
  instance_type = "t2.micro"
}

output "ubuntu" {
  value = "${data.aws_ami.ubuntu.id}"
}

////////////////////    Finding ami Centos 7   ///////////////

data "aws_ami" "centos7" {           /// Names has to different. Platform and find this owner name.
  most_recent = true
  owners      = ["679593333241"]   ///owner number does not change

  filter {                       /// Filter can be many as needed
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

resource "aws_instance" "centos7" {
  ami           = "${data.aws_ami.centos7.id}" /// using ami founded in filter block and creating centos instance
  instance_type = "t2.micro"
}

output "centos7" {
  value = "${data.aws_ami.centos7.id}"
}
# In this blck find ami create instance and show output of instance.




output "name"{
    value ="solongo"
}

output "last name"{
    value ="ganbold"
}

// output of key-pair

# resource "aws_key_pair" "us-east-1" {
#   key_name   = "test_bastion"
#   public_key =  "${file("~/.ssh/id_rsa.pub")}"
# }

output "key-pair"{
    value = "${aws_key_pair.us-east-1.key_name}"
}

output "public-key"{
value = "${aws_key_pair.us-east-1.public_key}"
}


///output of this instance

# resource "aws_instance" "web" {
#   ami           = "ami-0323c3dd2da7fb37d"
#   instance_type = "t2.micro"
#   key_name     = "${aws_key_pair.us-east-1.key_name}"
#   security_groups  = ["${aws_security_group.test-ter.name}"]
#   tags = {
#     Name = "HelloWorld"
#   }
# }

output "instance_id"{
value ="${aws_instance.web.id}"
}

output "instance_arn"{
    value ="${aws_instance.web.arn}"
}

output "instance_instance_type"{
    value ="${aws_instance.web.instance_type}"
}

output "instance_az"{
    value ="${aws_instance.web.availability_zone}"
}

output "instance_public_ip"{
    value ="${aws_instance.web.public_ip}"
}

output "my_message"{
   value =  "please log in change your password"
}
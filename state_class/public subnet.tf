
/////////////      Public subnet       ///////////////////////////////////////////////////////////////
resource "aws_subnet" "public1" {
    
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.101.0/24"
}
resource "aws_subnet" "public2" {
    
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.102.0/24"
}
resource "aws_subnet" "public3" {
    
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.103.0/24"
}

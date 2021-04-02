resource "aws_instance" "test-instance" {
  ami           = "ami-0996d3051b72b5b2c"
  instance_type = "t3.micro"
  tags = {
    Name = "tf-example"
  }
}

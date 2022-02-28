resource "aws_instance" "default" {
  ami    = "INVALID-AMI" # <-Set invalid value to `ami`
  # instance_type = "t3.micro"    <- Comment out mandatory field `instance_type`
}
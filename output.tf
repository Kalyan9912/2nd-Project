output "vpc_id" {
    description = "THis is my vpc id "
    value = aws_vpc.DEMOVPC.id
  
}
output "AMIID" {
    description = "THis is my amiid"
    value = aws_instance.myec2.ami
  
}
output "publicip" {
    description = "THis is my public ip"
    value = aws_instance.myec2.public_ip
  
}
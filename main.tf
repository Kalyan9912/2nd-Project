resource "aws_vpc" "DEMOVPC" {
    cidr_block = var.myvpc_cidr
    tags = {
      Name=var.vpctag
    }
  
}

resource "aws_subnet" "MYSUBNET" {
    vpc_id = aws_vpc.DEMOVPC.id
    availability_zone = var.avail_zone
    cidr_block = var.subnet_cidr
    map_public_ip_on_launch = true
    tags = {
      Name=var.subnettag
    }
  
}

resource "aws_route_table" "myrt" {
    vpc_id=aws_vpc.DEMOVPC.id
     route {
    cidr_block = var.routetabvalue
    gateway_id = aws_internet_gateway.gt.id
  }
    tags={
        Name= var.routename
    }
    
}

resource "aws_instance" "myec2" {
    ami = var.ami_idd
    instance_type= var.instancetaype
    key_name="jenkins"
   
    subnet_id=aws_subnet.MYSUBNET.id
    tags ={
        Name="MINE"

    }
      
}

resource "aws_internet_gateway" "gt" {
    vpc_id = aws_vpc.DEMOVPC.id
    tags = {
      Name=var.myintgate
    }
  
}
resource "aws_route_table_association" "rtasso" {
  subnet_id = aws_subnet.MYSUBNET.id
  route_table_id = aws_route_table.myrt.id
}






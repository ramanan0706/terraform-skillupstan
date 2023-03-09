
resource "aws_instance" "terra_ec2" {
    ami = "ami-062df10d14676e201"
    instance_type = "t2.micro"
    key_name = "ec2_key_pair"
    subnet_id = "subnet-0c3d295b6ecff130f"
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.terra_sg.id]
    root_block_device {
      volume_size = 20
      volume_type = "gp2"
      delete_on_termination = true
    }
    
    tags = {
      "Name" = "terra-ec2"
    }

}



resource "aws_security_group" "terra_sg" {
  name = "terra-sg"
  description = "terraform course security group"
  vpc_id = "vpc-06f4255c5722106aa"


  ingress = [ {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Inbound Terraform Security Group"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
    
  },
  {
    protocol = -1
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Outbound Terraform Security Group"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false 
  },
  {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Inbound Terraform Security Group"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false 
  }
]

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 tags = {
   "Environment" = "DEV"
 }
}
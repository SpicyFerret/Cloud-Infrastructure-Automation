# # create EC2 instance in the public subnet 1a
# resource "aws_instance" "ami-065101b35d4f06f41" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"
#   subnet_id     = aws_subnet.public_subnet_1a.id

#   tags = {
#     Name = "Ec2-CLC16"
#   }
## instalação do apache 
#   user_data = <<-EOF
#               #!/bin/bash
#               sudo apt update -y
#               sudo apt install apache2 -y
#               sudo systemctl start apache2
#               sudo systemctl enable apache2
#               echo "<h1>CHEGUEI ATÉ AQUI - Danilo Neumann Marques - CLC 16</h1>" | sudo tee /var/www/html/index.html
#               EOF
# }

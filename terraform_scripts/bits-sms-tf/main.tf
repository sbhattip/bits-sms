
resource "aws_security_group" "frontend_sg"{
    name = "frontend-sg"
    vpc_id = var.vpc_webapp

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "backend_sg"{
    name = "backend_sg"
    vpc_id = var.vpc_webapp

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "server_keypair" {
    key_name = "server_keypair"
    public_key = tls_private_key.rsa.public_key_openssh  
}

resource "local_file" "sms_key" {
    content = tls_private_key.rsa.private_key_pem
    filename = "sms_key.pem"  
}

resource "aws_instance" "frontend_server"{
    ami = var.ami_id
    instance_type = var.ec2_type
    vpc_security_group_ids = [aws_security_group.frontend_sg.id]
    subnet_id = var.subnet_webapp
    user_data = base64encode(file("userdata_frontend.sh"))
    key_name = "server_keypair"
    tags = {
        Name = "frontend_server"
    }
    
}

resource "aws_instance" "backend_server"{
    ami = var.ami_id
    instance_type = var.ec2_type
    vpc_security_group_ids = [aws_security_group.backend_sg.id]
    subnet_id = var.subnet_webapp
    user_data = base64encode(file("userdata_backend.sh"))
    key_name = "server_keypair"
    tags = {
        Name = "backend_server"
    }
}

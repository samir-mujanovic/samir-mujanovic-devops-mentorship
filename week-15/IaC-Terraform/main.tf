provider "aws" {
  region = "eu-central-1"
}

variable default_cidr_block {
  description = "The default CIDR block"
}

variable tag_name {
    description = "CreatedBy tag name"
}

variable instance_type {
    description = "The instance type"
}

variable ami_id {
    description = "AMI ID"
}

# Create the security groups for the database server instance and the web server instance
resource "aws_security_group" "web_server_tf_sg" {
  name        = "web-server-tf-sg"
  description = "Security group for the web server instance created by Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.default_cidr_block]
  }

  tags = {
    Name        = "web-server-sg-tf"
    CreatedBy   = var.tag_name
    Project     = "task-12"
    IaC         = "Terraform"
  }
}

resource "aws_security_group" "db_server_tf_sg" {
  name        = "db-server-tf-sg"
  description = "Security group for the database server instance created by Terraform"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = [var.default_cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr_block]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = [var.default_cidr_block]
  }

  tags = {
    Name        = "db-server-sg-tf"
    CreatedBy   = var.tag_name
    Project     = "task-12"
    IaC         = "Terraform"
  }
}

# Create the EC2 instances for the web server and the database server
resource "aws_instance" "web_server_tf" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server_tf_sg.id]
  key_name      = "samir-mujanovic-web-server-key"

  tags = {
    Name        = "task-12-web-server-tf"
    CreatedBy   = var.tag_name
    Project     = "task-12"
    IaC         = "Terraform"
  }
}

resource "aws_instance" "db_server_tf" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.db_server_tf_sg.id]
  key_name      = "samir-mujanovic-web-server-key"
  
  tags = {
    Name        = "task-12-db-server-tf"
    CreatedBy   = var.tag_name
    Project     = "task-12"
    IaC         = "Terraform"
  }
}

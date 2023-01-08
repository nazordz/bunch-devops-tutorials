resource "aws_iam_instance_profile" "ssm_core" {
  name = "ssm-core"
  role = aws_iam_role.ssm.name
}

resource "aws_iam_role" "ssm" {
  name = "ssm-core"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ssm_code" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_security_group" "client" {
  name   = "client"
  vpc_id = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "client" {
  ami = data.aws_ami.ubuntu_jammy.id

  # T3 uses Intel processor while T3a uses AMD processor, 
  # both are running at 2.5 GHz.
  instance_type          = "t3a.xlarge"
  subnet_id              = aws_subnet.public_us_east_1a.id
  vpc_security_group_ids = [aws_security_group.client.id]

  iam_instance_profile = aws_iam_instance_profile.ssm_core.name

  tags = {
    Name = "client.antonputra.pvt"
  }
}

output "client" {
  value = aws_instance.client.id
}

data "aws_ami" "ubuntu_jammy" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "server" {
  ami                    = data.aws_ami.ubuntu_jammy.id
  instance_type          = "t3a.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}", "${aws_security_group.allow_http.id}"]
  key_name               = aws_key_pair.server.key_name
  tags = {
    Name = "Server"
  }
}

resource "aws_key_pair" "this" {
  count = var.generate_key_pair ? 1 : 0
  key_name = "${var.name}_key" 
  public_key = tls_private_key.rsa[0].public_key_openssh
}

resource "tls_private_key" "rsa" {
  count = var.generate_key_pair ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "rsa_private_key" {
  count = var.generate_key_pair ? 1 : 0
  content  = tls_private_key.rsa[0].private_key_openssh
  filename = "${path.root}/${var.name}.pem"
}

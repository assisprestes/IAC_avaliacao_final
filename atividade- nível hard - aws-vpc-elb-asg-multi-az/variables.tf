variable "aws_key_path" {
    description = "Public key path"
    default = "/labuser.pub"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}
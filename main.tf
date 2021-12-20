module "asg" {
  source = "./modules/"

  aws-profile = "default"
  aws-region  = "us-east-1"

  instance-ami     = "ami-0ed9277fb7eb570c9"  
  asg-min-size     = "2"                      # number of machines
  asg-max-size     = "4"
  asg-def-size     = "2"
}
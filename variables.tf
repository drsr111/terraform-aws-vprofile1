variable AWS_REGION {
  default = "us-east-2"
}

variable AMIS {
  type= map
  default = {
    us-east-2 = "ami-02f3416038bdb17fb"
    us-east-1 = "ami-02f3416038bdb17fb"
    ap-south-1 = "ami-02f3416038bdb17fb"
  }
}

variable PRIVATE_KEY_PATH{
  default = "vprofilekey"
}

variable PUBLIC_KEY_PATH{
  default = "vprofilekey.pub"
}

variable USER {
  default = "ubuntu"
}

variable MYIP {
  default = "49.206.32.253/32"
}

variable rmquser {
  default = "rabbit"
}

variable rmqpass {
  default = "Gr33n@pple123456"
}

variable dbuser {
  default = "admin"
}
variable dbpass {
  default = "admin123"
}

variable dbname {
  default = "accounts"
}

variable instance_count{
  default = "1"
}

variable VPC_NAME{
  default ="vprofile-VPC"
}

variable Zone1 {
  default = "us-east-2a"
}

variable Zone2 {
  default = "us-east-2b"
}

variable Zone3 {
  default = "us-east-2c"
}

variable Zone4 {
  default = "us-east-2d"
}

variable Zone5 {
  default = "us-east-2e"
}

variable Zone6 {
  default = "us-east-2f"
}

variable VpcCIDR{
  default = "172.21.0.0/16"
}

variable PubSub1CIDR{
  default = "172.21.1.0/24"
}

variable PubSub2CIDR{
  default = "172.21.2.0/24"
}
variable PubSub3CIDR{
  default = "172.21.3.0/24"
}
variable PriSub4CIDR{
  default = "172.21.4.0/24"
}
variable PriSub5CIDR{
  default = "172.21.5.0/24"
}
variable PriSub6CIDR{
  default = "172.21.6.0/24"
}
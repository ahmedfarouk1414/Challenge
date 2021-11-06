variable "AWS_REGION" {
  default = "eu-central-1"
}


variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-central-1 =  "ami-047e03b8591f2d48a"
  }
}

variable "RDS_PASSWORD" {
}



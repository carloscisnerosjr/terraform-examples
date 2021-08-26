variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
  default     = "radius_server"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 2
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-062529cc6250b10cd"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "okta-radius-server"
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-085b04f3bdbe7444c"]
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = ["subnet-0116c0161b40cb027", "subnet-0997a2f52c5370f81"]
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
  default     = true
}

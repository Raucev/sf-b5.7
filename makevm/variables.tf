variable "image_id" {
  type    = string
  default = "fd8vg2rh5ot45tdpgtcp"
}
variable "zone" {
  type    = string
  default = "ru-central1-a"
}
variable "nat" {
  type    = bool
  default = false
}
variable "subnet_name" {
  default = "default"
}
variable "cidr" {
  default = ["10.128.0.0/24"]
}
variable "name" {
  type    = string
  default = "test"
}
variable "ip_address" {
  type    = string
  default = "test"
}
variable "image_name" {
  type    = string
  default = "lemp"
}
variable "image_family" {
  type    = string
  default = "lemp"
}
variable "nat_ip" {
  type    = string
  default = "62.84.112.135"
}

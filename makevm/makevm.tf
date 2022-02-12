terraform {
  required_version = "= 1.1.4"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.71.0"
    }
  }
}
resource "yandex_compute_image" "image" {
  name          = var.image_name
  source_family = var.image_family #"fd8vg2rh5ot45tdpgtcp"
}

resource "yandex_compute_instance" "default" {
  name        = var.name
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.image.id
    }
  }
  network_interface {
    ipv4 = true
    #ip_address = " "
    ipv6 = false
    #ipv6_address = " "
    #security_groups_ids = ""
    #dns_record = ""
    #ipv6_dns_record = ""
    #nat_dns_record = ""
    nat            = var.nat
    nat_ip_address = var.nat ? var.nat_ip : null
    subnet_id      = yandex_vpc_subnet.default-subnet.id

  }
  metadata = {
    name     = "name"
    ssh-keys = "name:${file("~/.ssh/id_rsa.pub")}"
  }



}
#resource "yandex_vpc_network" "default" {
#    name = "default"
#}

resource "yandex_vpc_subnet" "default-subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = "enp42n01m2rn6vvimf5f" #"${yandex_vpc_network.default.id}"
  v4_cidr_blocks = var.cidr
}

data "yandex_compute_instance" "my_instance" {
  name = yandex_compute_instance.default.name
}


output "subnet_id" {
  value = yandex_vpc_subnet.default-subnet.id
}

output "ip_address" {
  value = data.yandex_compute_instance.my_instance.network_interface.0.ip_address
}

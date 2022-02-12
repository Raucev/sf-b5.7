terraform {
  required_version = "= 1.1.4"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.71.0"
    }
  }
  backend "s3" { # тип используемого хранилища
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terrastate"          # имя хранилища
    key        = "./terraform.tfstate" # путь до state-файла в хранилище 
    region     = "us-east-1"           # регион размещения хранилища
    access_key = "<access_key>"
    secret_key = "<secret_key>"

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}


provider "yandex" {
  token = "<token>"
  #service_account_key_file = "./key.json"
  cloud_id  = "<cloud_id>"
  folder_id = "<folder_id>"
  zone      = "ru-central1-a"
}



module "makevm1" {
  source       = "./makevm"
  name         = "vm1"
  nat          = true
  image_name   = "lemp"
  image_family = "lemp"
  subnet_name  = "vm1"
  zone         = "ru-central1-a"
  cidr         = ["10.128.0.0/24"]
}

module "makevm2" {
  source       = "./makevm"
  name         = "vm2"
  image_name   = "lamp"
  image_family = "lamp"
  #image_id  = yandex_compute_image.lamp.id
  zone        = "ru-central1-b"
  subnet_name = "vm2"
  cidr        = ["10.129.0.0/24"]
}






resource "yandex_lb_target_group" "make_group" {
  name      = "my-target-group"
  region_id = "ru-central1"

  target {
    subnet_id = module.makevm1.subnet_id
    address   = module.makevm1.ip_address
  }

  target {
    subnet_id = module.makevm2.subnet_id
    address   = module.makevm2.ip_address
  }
}


resource "yandex_lb_network_load_balancer" "load-balancer" {
  name = "my-network-load-balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.make_group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}



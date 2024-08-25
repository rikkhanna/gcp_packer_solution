packer {
    required_plugins {
        googlecompute = {
                source = "github.com/hashicorp/googlecompute"
                version = "~> 1"
        }
    }
}

source "googlecompute" "debian" {
    project_id = var.project_id
    source_image = "debian-11-bullseye-v20240815"
    zone = "us-central1-a"
    ssh_username  = var.user
    ssh_password  = var.password
    network = "demo"

}

variable "project_id" {
    type = string
    default = "rish-dev"
}
variable "user" {
    type = string
}
variable "password" {
    type = string
}

build {
  sources = ["source.googlecompute.debian"]
}
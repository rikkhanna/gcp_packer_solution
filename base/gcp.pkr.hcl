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

}

variable {
    type = string
    default = "rish-dev"
}

build {
  sources = ["source.googlecompute.debian1190"]
}
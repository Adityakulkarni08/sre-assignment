terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "compose" {
  name         = "docker/compose:latest"
  keep_locally = true
}

resource "null_resource" "docker_compose_up" {
  provisioner "local-exec" {
    command = "docker compose up -d"
    working_dir = "${path.module}/.."
  }
}


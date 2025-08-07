terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "e_vehicle" {
  name = "e-vehicle-app"
  build {
    context    = "${path.module}/app"
    dockerfile = "${path.module}/app/Dockerfile"
  }
}

resource "docker_container" "e_vehicle" {
  name  = "e-vehicle-container"
  image = docker_image.e_vehicle.latest

  ports {
    internal = 5000
    external = 5000
  }
}

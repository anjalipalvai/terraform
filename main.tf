provider "google" {
  credentials = file("/tmp/key.json")  
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-vpc"
}

resource "google_compute_instance" "vm_instances" {
  count        = 2
  name         = "vm-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name

    access_config {
      # Allocate a public IP
    }
  }

  tags = ["web", "dev"]
}


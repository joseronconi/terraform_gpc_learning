data "google_compute_image" "my_image" {
  # buscar no google provider algum dado, pegar dado atualizado, como a ultima imagem

    most_recent = true

    filter = {
      name = "name"
      values = ["debian-10-*"]
    }

    filter {
      name = "family"
      values = ["debian-10"]
    }

}
resource "google_compute_instance" "my_instance" {
    name = "terraform-instance"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    allow_stopping_for_update = true

    boot_disk {
        initialize_params {
            image = data.google_compute_image.my_image.self_link
        }
    }

    network_interface {
        network = google_compute_network.terraform_network.self_link
        subnetwork = google_compute_subnetwork.terraform_subnetwork.self_link
        access_config {
            //this empty ensure that the instance will have a public ip
        }
    }    
}

resource "google_compute_network" "terraform_network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}
  
resource "google_compute_subnetwork" "terraform_subnetwork" {
    name= "terraform-subnetwork"
    ip_cidr_range = "192.168.1.0/24"
    region = "us-central1"
    network = google_compute_network.terraform_network.id
  
}


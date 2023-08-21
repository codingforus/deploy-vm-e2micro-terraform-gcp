## GCP Linux VM
# Replace PROJECT_NAME with your own project name or something unique
# Replace SSH_PUBLIC_KEY with your own public ssh key

# VM
resource "google_compute_instance" "gcp-ubnt-vm" {
  name                      = var.vm_name
  machine_type              = var.vm_instance_type
  zone                      = var.gcp_zone
  can_ip_forward            = "true"
  allow_stopping_for_update = "true"
  tags                      = ["ssh","http-server","https-server", "mail"]

  boot_disk {
      auto_delete = true
      device_name = "PROJECT_NAME"
      mode   = "READ_WRITE"
      initialize_params {
          image = "ubuntu-os-cloud/ubuntu-minimal-2204-lts"
          size = 30
          type = "pd-standard"
      }
  }

  metadata = {
    ssh-keys = "${var.user}:SSH_PUBLIC_KEY ${var.user}"
  }

  metadata_startup_script = "${file("../startup/startup.sh")}"

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config {
    }
  }

  scheduling {
    automatic_restart = true
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = true
    enable_vtpm                 = true
  }

# File Copy
provisioner "file" {
   source      = "../compose/docker-compose.yaml"
   destination = "/home/${var.user}/docker-compose.yaml"
   connection {
     host        = google_compute_instance.gcp-ubnt-vm.network_interface.0.access_config.0.nat_ip
     type        = "ssh"
     user        = var.user
     timeout     = "500s"
     private_key = file(var.privatekeypath)
   }
 }
provisioner "file" {
   source      = "../maintenance/update-ghost.sh"
   destination = "/home/${var.user}/update-ghost.sh"
   connection {
     host        = google_compute_instance.gcp-ubnt-vm.network_interface.0.access_config.0.nat_ip
     type        = "ssh"
     user        = var.user
     timeout     = "500s"
     private_key = file(var.privatekeypath)
   }
 }
}
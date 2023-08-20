## Network - Main
# Replace PROJECT_NAME of all resources with your own project name or something unique

# Create VPC
resource "google_compute_network" "vpc" {
  name                    = "PROJECT_NAME-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "network_subnet" {
  name          = "PROJECT_NAME-subnet"
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.vpc.name
  region        = var.gcp_region
}

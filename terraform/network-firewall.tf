## Network Firewall Rules
# Replace PROJECT_NAME of all resources with your own project name or something unique

# allow http
resource "google_compute_firewall" "allow-http" {
  name    = "PROJECT_NAME-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
}

# allow https
resource "google_compute_firewall" "allow-https" {
  name    = "PROJECT_NAME-fw-allow-https"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["https-server"]
}

# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "PROJECT_NAME-fw-allow-http-fw-allow-ssh"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
}

# allow mail
resource "google_compute_firewall" "allow-mail" {
  name    = "PROJECT_NAME-fw-allow-mail"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["2525"]
  }

  direction          = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]
  target_tags = ["mail"]
}
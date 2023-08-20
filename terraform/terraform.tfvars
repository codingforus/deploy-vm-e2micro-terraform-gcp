## Terraform - Variables
# Replace PROJECT_NAME of all resources with your own project name or something unique
# Replace USER with your own name. See below.

# GCP Settings
gcp_project   = "PROJECT_ID"
gcp_region    = "us-east1"
gcp_zone      = "us-east1-b"
gcp_auth_file = "../auth/google-key.json"

# GCP Netwok
network-subnet-cidr = "10.0.10.0/24"

# Linux VM
vm_instance_type = "e2-micro"
user = "USER" # The user used to login into GCP. Be aware of dots in the name. This will be underscores.
email = "tf-serviceaccount@PROJECT_ID.iam.gserviceaccount.com" # this should match the service account we set earlier

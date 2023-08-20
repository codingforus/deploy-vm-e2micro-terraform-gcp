# deploy-vm-e2micro-terraform-gcp
Deploy an e2-micro VM instance with Terraform to Google Cloud Platform

# Terraform 
Ready to use Terraform files to deploy a VM instance to GCP. Change the files if required. Some values needs to be replaced. You can find the instructions in each file.

# Startup
In the startup folder there is a script which is executed when the VM instance is deployed and running in GCP. It will grant sudo access to the GCP user. Furthermore, Docker will be installed on the machine.

# Compose
A `docker-compose.yaml` file which contains services to run a Ghost blogging platform on the running VM instance. One service which contains the Ghost engine, one service which contains the Ghost database running on MySQL and one service containg the reverse proxy with Traefik.

# Maintenance
An update script to be frequently executed to keep the Docker containers up to date. This is optional.
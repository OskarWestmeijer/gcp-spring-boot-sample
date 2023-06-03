provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}

terraform {
  backend "gcs" {
    bucket = "gcp-spring-boot-sample-tfstate"
    prefix = "terraform/state"
  }
}

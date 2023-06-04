resource "google_cloud_run_service" "gcp_spring_boot_sample" {
  name     = "gcp-spring-boot-sample"
  location = var.project_region

  template {
    spec {
      containers {
        image = var.service_image
        resources {
          limits = {
            cpu    = "200m"
            memory = "512M"
          }
        }
      }
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

}
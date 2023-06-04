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
        "run.googleapis.com/ingress"       = "all"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

}

resource "google_cloud_run_service_iam_binding" "service_access_control" {
  location = google_cloud_run_service.gcp_spring_boot_sample.location
  service  = google_cloud_run_service.gcp_spring_boot_sample.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}
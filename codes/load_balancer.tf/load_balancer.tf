resource "google_compute_region_health_check" "regional_health_check" {
  provider = google-beta
  name     = "my-regional-health-check"
  region   = "europe-west1"

  http_health_check {
    port         = 80
    request_path = "/"
  }
}

resource "google_compute_region_backend_service" "backend_service" {
  provider = google-beta
  name     = "my-backend-service"
  region   = "europe-west1"

  health_checks = [google_compute_region_health_check.regional_health_check.id]

  backend {
    group = google_compute_instance_group_manager.managed_instance_group_v2.instance_group
  }
}

provider "google" {
    project = "terraform-project-416921"
   credentials = file("/home/alifiratcobanoglu/jsonfile.json")
    region = "europe-west1"
}

resource "google_compute_network" "vpc_network" {
  name="my-vpc-network"
}

resource "google_compute_subnetwork" "subnet" {
    name = "my-subnet"
    ip_cidr_range = "10.0.1.0/24"
    region ="europe-west1"
    network = google_compute_network.vpc_network.self_link  
}
resource "google_compute_health_check" "default" {
  name               = "my-health-check"
  check_interval_sec = 5
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  http_health_check {
    port         = 80
    request_path = "/"
  }
}


resource "google_storage_bucket" "terraform_state" {
  name          = "alifiratcobanoglu144"
  location      = "EU"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = "30"
    }
    action {
      type = "Delete"
    }
  }
}

terraform {
  backend "gcs" {
    bucket  = "alifiratcobanoglu144"
    prefix  = "terraform/state"
  }
}

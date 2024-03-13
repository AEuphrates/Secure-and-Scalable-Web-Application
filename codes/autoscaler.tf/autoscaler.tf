resource "google_compute_autoscaler" "autoscaler" {
  name   = "my-autoscaler"
  target = google_compute_instance_group_manager.managed_instance_group_v2.self_link
  zone               = "europe-west1-c"
  
  autoscaling_policy {
    max_replicas    = 10
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5  // This represents 50%
    }
  }
}

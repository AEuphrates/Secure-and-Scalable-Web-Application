resource "google_compute_router" "cloud_router" {
    name ="my-cloud-router"
    network = google_compute_network.vpc_network.self_link
    
}

resource "google_compute_router_nat" "nat_gateway" {
    name= "my-nat-gateway"
    router = google_compute_router.cloud_router.name
    region = "europe-west1"
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
      nat_ip_allocate_option = "AUTO_ONLY"
}

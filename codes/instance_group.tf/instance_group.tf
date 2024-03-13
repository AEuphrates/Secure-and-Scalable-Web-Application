resource "google_compute_instance_template" "instance_template_v2" {
  name         = "my-instance-template-v2"
  machine_type = "e2-micro"

  disk {
    source_image = "debian-11"
  }
  metadata = {
    startup-script = <<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
echo "Welcome to my website!" > /var/www/html/index.html
EOF
  }

  network_interface {
    network    = "projects/terraform-project-416921/global/networks/my-vpc-network"
    subnetwork = "projects/terraform-project-416921/regions/europe-west1/subnetworks/my-subnet"
  }
}

resource "google_compute_instance_group_manager" "managed_instance_group_v2" {
  base_instance_name = "my-instance-group-v2"
  zone               = "europe-west1-c"
  name               = "my-instance-group-v2"
  target_size        = 3

  version {
    name              = "v1"  # Versiyona bir isim ekleyin
    instance_template = google_compute_instance_template.instance_template_v2.self_link
  }

  named_port {
    name = "http"
    port = 80
  }
}

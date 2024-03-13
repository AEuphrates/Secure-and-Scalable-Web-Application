# GCP'de Terraform ile Managed Instance Group Oluşturma

Bu kılavuz, Google Cloud Platform'da bir Managed Instance Group (MIG) oluşturmak ve yönetmek için Terraform yapılandırmasının nasıl kullanılacağını açıklar. Bu yapılandırma, dinamik olarak ölçeklenebilen ve yüksek erişilebilirlik sağlayan bir grup sanal makine (VM) örneği oluşturur.

## Ön Koşullar
- Google Cloud hesabı ve projenin olması gerekir.
- `gcloud` ve `terraform` yüklü ve yapılandırılmış olması gerekir.
- GCP'de yapılandırılmış bir VPC ağı ve subnetwork ( `main.tf` ve `router_nat.tf`dosyalarında tanımlanmış) olması gerekir.
- Yapılandırılmış bir Load Balancer ve Autoscaler (`load_balancer.tf` ve `autoscaler.tf` dosyalarında tanımlanmış)


## Yapılandırma

### Instance Template Oluşturma

Instance Template, MIG tarafından oluşturulan VM örneklerinin yapılandırmasını tanımlar:

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
### Managed Instance Group Oluşturma

MIG, belirli bir zone'da VM örneklerini yönetir ve ölçeklendirir:

    resource "google_compute_instance_group_manager" "managed_instance_group_v2" {
    base_instance_name = "my-instance-group-v2"
    zone               = "europe-west1-c"
    name               = "my-instance-group-v2"
    target_size        = 3
    version {
    name              = "v1"
    instance_template = google_compute_instance_template.instance_template_v2.self_link
    }
    named_port {
    name = "http"
    port = 80
    }
    }


## Kullanım
1. Terraform yapılandırma dosyalarınızın bulunduğu dizinde, Terraform'u başlatın:
   `terraform init`
2. Yapılandırmanın doğruluğunu ve oluşturulacak kaynakları kontrol edin:
   `terraform plan`
3. Kaynakları oluşturmak için Terraform uygulamasını çalıştırın:
   `terraform apply`
4. Kaynakları başarıyla oluşturduktan sonra, onları kaldırmak isterseniz (Tamamen silinecektir, gerek olmadıkça kullanmanız önerilmez.) :
   `terraform destroy`

   ## Ek Notlar
   
- Bu yapılandırma, Debian tabanlı VM'lerde çalışan ve başlangıçta Apache2 web sunucusu kurulan bir instance template kullanır.
- MIG, belirtilen target_size değerine göre otomatik olarak VM örneklerini oluşturur ve yönetir.
- Projedeki diğer bileşenlerle entegrasyon için (`load_balancer.tf`, `autoscaler.tf` vb.), bu bileşenlerin dokümantasyonuna başvurun. 

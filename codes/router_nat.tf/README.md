# Terraform ile GCP'de NAT Gateway ve Cloud Router Oluşturma

## Ön Koşullar
- Google Cloud hesabı ve proje
- `gcloud` ve `terraform` yüklü ve yapılandırılmış
- Önceden oluşturulmuş bir VPC ağı (`main.tf` dosyasında tanımlanmış)
- Servis hesabı anahtar dosyası (`servis_hesabi.json`)

## Yapılandırma
`router_nat.tf` dosyası, bir Cloud Router ve NAT Gateway oluşturur:
**Google Compute Router** (`google_compute_router`): Bu kaynak, belirli bir VPC ağında bir Cloud Router oluşturur.
**Google Compute Router NAT** (`google_compute_router_nat`): Bu kaynak, oluşturulan Cloud Router üzerinde bir NAT Gateway oluşturur ve tüm alt ağlardaki IP aralıklarını NAT üzerinden çıkarır.


## Cloud Router Oluşturma

Cloud Router, belirli bir VPC ağı içinde oluşturulur ve NAT Gateway ile ilişkilendirilir:

    resource "google_compute_router" "cloud_router" {

    name    = "my-cloud-router"
    
    network = google_compute_network.vpc_network.self_link
    
    }

## NAT Gateway Oluşturma

NAT Gateway, oluşturulan Cloud Router'a bağlanır ve otomatik olarak NAT IP'leri ataması için yapılandırılır:

    resource "google_compute_router_nat" "nat_gateway" {

    name                                = "my-nat-gateway"
    
    router                              = google_compute_router.cloud_router.name
    
    region                              = "europe-west1"
    
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    
    nat_ip_allocate_option              = "AUTO_ONLY"
    
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

## Diğer Bileşenler

Bu README, projenizin router_nat.tf kısmını kapsar. main.tf ve diğer Terraform dosyaları için lütfen ilgili README dosyalarına bakın.

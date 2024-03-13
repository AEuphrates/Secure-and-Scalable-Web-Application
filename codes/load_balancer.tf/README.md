# GCP'de Terraform ile Bölgesel Sağlık Kontrolü ve Arka Uç Hizmeti Oluşturma

## Ön Koşullar
- Google Cloud hesabı ve projenin olması gerekir.
- `gcloud` ve `terraform` yüklü ve yapılandırılmış olması gerekir.
- GCP'de yapılandırılmış bir VPC ağı ve subnetwork ( `main.tf` ve `router_nat.tf`dosyalarında tanımlanmış) olması gerekir.
- Yapılandırılmış bir Load Balancer ve Autoscaler (`load_balancer.tf` ve `autoscaler.tf` dosyalarında tanımlanmış)
- Google-beta provider'ın Terraform yapılandırmasında tanımlı olması
- Bir Managed Instance Group (MIG) (instance_group.tf dosyasında tanımlanmış)

## Yapılandırma

### Bölgesel Sağlık Kontrolü Oluşturma

Bölgesel sağlık kontrolü, HTTP sağlık kontrolü yaparak arka uç hizmetlerin sağlığını izler:

    resource "google_compute_region_health_check" "regional_health_check" {
  
    provider = google-beta
  
    name     = "my-regional-health-check"
  
    region   = "europe-west1"

    http_health_check {
  
    port         = 80
  
    request_path = "/"
  
    }
  
    }


### Bölgesel Arka Uç Hizmeti Oluşturma

Bölgesel arka uç hizmeti, trafik dağıtımını yönetir ve sağlık kontrolüne dayanarak trafik yönlendirir:

    resource "google_compute_region_backend_service" "backend_service" {
    provider = google-beta
    name     = "my-backend-service"
    region   = "europe-west1"

    health_checks = [google_compute_region_health_check.regional_health_check.id]

    backend {
    group = google_compute_instance_group_manager.managed_instance_group_v2.instance_group
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
- Bu yapılandırma, uygulamanızın yüksek erişilebilirliğini sağlamak için önemlidir. Bölgesel sağlık kontrolü, arka uç hizmetlerin durumunu düzenli olarak kontrol eder.
- Arka uç hizmet, sağlık kontrolünden geçen VM örneklerine trafik yönlendirir, böylece yalnızca sağlıklı örnekler trafik alır.
- Google-beta provider kullanımı, bölgesel kaynakların kullanımını mümkün kıla

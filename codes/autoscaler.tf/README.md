# GCP'de Terraform ile Autoscaler Oluşturma

Bu kılavuz, Google Cloud Platform'da bir Autoscaler oluşturmak ve yönetmek için Terraform yapılandırmasının nasıl kullanılacağını açıklar. Autoscaler, belirli bir Managed Instance Group (MIG) için dinamik olarak ölçeklendirme sağlar, böylece uygulamanızın yüküne bağlı olarak VM örneklerinin sayısını artırabilir veya azaltabilir.

## Ön Koşullar
- Google Cloud hesabı ve projenin olması gerekir.
- `gcloud` ve `terraform` yüklü ve yapılandırılmış olması gerekir.
- GCP'de yapılandırılmış bir VPC ağı ve subnetwork ( `main.tf` ve `router_nat.tf`dosyalarında tanımlanmış) olması gerekir.
- Bir Managed Instance Group (MIG) (instance_group.tf dosyasında tanımlanmış)

## Yapılandırma

### Autoscaler Oluşturma

Autoscaler, belirli bir MIG için ölçeklendirme politikalarını tanımlar. Bu politikalar, MIG'daki VM örneklerinin sayısının ne zaman ve nasıl değiştirileceğini belirler:

    resource "google_compute_autoscaler" "autoscaler" {
    name   = "my-autoscaler"
    target = google_compute_instance_group_manager.managed_instance_group_v2.self_link
    zone   = "europe-west1-c"
  
    autoscaling_policy {
    max_replicas    = 10
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
    target = 0.5  // Bu, hedef CPU kullanımını %50 olarak belirler
    }
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
   Bu yapılandırma, CPU kullanımı %50'ye ulaştığında MIG'daki VM örneklerinin sayısını artırır. CPU kullanımı düşerse, örneklerin sayısı azaltılır, ancak her zaman en az bir örnek çalışır.
    `max_replicas` ve `min_replicas` değerleri, örnek sayısının üst ve alt sınırlarını belirler.
    cooldown_period, ölçeklendirme işlemleri arasındaki minimum bekleme süresidir (saniye cinsinden).

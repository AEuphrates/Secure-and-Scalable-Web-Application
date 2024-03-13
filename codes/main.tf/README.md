# Terraform ile GCP Altyapısı Oluşturma

Bu dosya, Google Cloud Platform üzerinde bir VPC ağı, bir alt ağ, bir sağlık kontrolü ve bir Google Storage bucket oluşturmak için Terraform kullanır. 

Projeyi başlatmak ve yönetmek için aşağıdaki adımları izleyin.

## Ön Koşullar

1. Google Cloud hesabı olmalı.
2. Terraform yüklü olmalı.

## Yapılandırma
1. Google Cloud projesi oluşturun veya mevcut bir projeyi kullanın.
2. `jsonfile.json` adında (veya sizin vereceğiniz başka bir isim) bir servis hesabı anahtarı dosyası oluşturun ve ilgili izinlere sahip olduğundan emin olun. Bu dosya, Terraform'un Google Cloud kaynaklarını yönetmek için kullanacağı kimlik bilgilerini içerir.
3. Servis hesabı anahtarı dosyasının yolu, Terraform yapılandırmanızda belirtilmelidir.

    provider "google" {
   
    project     = "terraform-project-416921"
   
    credentials = file("/path/json_dosyasi_ismi.json")
   
    region      = "europe-west1"
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

## Kaynaklar
Bu Terraform dosyası aşağıdaki kaynakları oluşturur:

- **Google Compute Network** *(VPC Network)*: VPC ağı my-vpc-network adıyla oluşturulur.
- **Google Compute Subnetwork**: my-subnet adında bir alt ağ, 10.0.1.0/24 CIDR bloğu ile oluşturulur.
- **Google Compute Health Check**: my-health-check adında bir sağlık kontrolü, HTTP kontrolü üzerinden port 80'de çalışacak şekilde yapılandırılmıştır.
- **Google Storage Bucket**: alifiratcobanoglu144 (bucket ismi global olarak benzersiz olmalıdır.) adında bir storage bucket, 30 gün sonra nesneleri otomatik olarak silmek üzere yapılandırılmıştır.

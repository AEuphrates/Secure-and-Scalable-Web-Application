# Deploying-Secure-and-Scalable-Web-Application 
Bu depo, Google Cloud Platform (GCP) üzerinde ölçeklenebilir ve güvenli web uygulamalarının Terraform aracılığıyla nasıl oluşturulacağı ve yönetileceği hakkında bilgiler içerir. Terraform, fiziksel makinelerden VM'lere, ağ anahtarlarından konteynerlere kadar neredeyse her tür altyapıyı temsil edebilen ve yönetebilen güçlü bir "Altyapı Olarak Kod" aracıdır.

Bu rehber, Terraform'un HashiCorp Configuration Language (HCL) kullanarak GCP'deki kaynakları nasıl oluşturabileceğinizi gösterir.

## Hızlı Başlangıç

Bu projeyi başlatmadan önce aşağıdaki gereksinimlerin karşılandığından emin olun:

- Google Cloud hesabı
- Terraform
- gcloud CLI

Kod örnekleri, GCP üzerinde HCL kullanarak Terraform ile yapılandırmalar içerir.

Tüm kod örnekleri bu depoda bulunabilir.

Kodları çalıştırma talimatları için lütfen her klasördeki `README`'ye danışın.

Bu repo aşağıdaki örnekleri içerir:
1. `main.tf`: Google Cloud provider ayarlarını, VPC ve subnet oluşturur.
2. `router_nat.tf`: Cloud Router ve NAT Gateway'i oluşturur.
3. `instance_group.tf`: E2-micro tipinde bir instance template ve Managed Instance Group oluşturur.
4. `autoscaler.tf`: Instance Group için CPU kullanımına dayalı bir otomatik ölçeklendirici oluşturur.
5. `load_balancer.tf`: Trafik yükünü yönetmek için bir yük dengeleyici ve sağlık kontrolü yapılandırır.
6. `PostgreSQL` yaratıldı.
7. En az ayrıcalık (least privilege principle) ilkesine göre bir `Service Account` oluşturuldu.
8. Projeyle uyumlu olarak CPU'nun belirli bir değerin üzerine çıktığında alarm verilmesi için policy oluşturuldu.
9. Terraform kullanarak oluşturduğumuz `VM Instance`'den `PostgreSQL`'a erişildi.

## Yapılandırma ve Deployment

Bu projede yapılan her öğe, Google Cloud Platform'un sağlam bulut altyapısını kullanarak, güvenli ve ölçeklenebilir bir web uygulaması sunmanızı sağlar. Her bir öğe için aşağıdaki adımları izleyerek altyapınızı başlatabilirsiniz:

1. Google Cloud'da bir proje oluşturun ve gerekli API'leri etkinleştirin.
2. Servis hesabı oluşturun ve JSON anahtar dosyasını indirin.
3. Terraform yapılandırma dosyalarınızı yerel ortamınıza kopyalayın.
4. `terraform init` ve `terraform apply` komutlarını çalıştırarak altyapınızı dağıtın.
5. Terraform kullanılmadan yapılan ayarlamalar için lütfen diğer dosyayı kontrol edin.

## Güvenlik ve İzinler

Projenin güvenliği, GCP'nin IAM ve servis hesapları özellikleri ile sağlanmaktadır. En az ayrıcalık prensibine göre hareket edilerek, sadece gerekli izinler atanmıştır.

## İletişim

Herhangi bir sorunuz olursa, iletişime geçin:

- E-posta: alifiratcobanoglu@gmail.com

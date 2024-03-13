# Service Account Oluşturma Süreci

Bu belge, Google Cloud Platform (GCP) üzerinde yeni bir Service Account oluşturma sürecini adım adım açıklamaktadır. Service Account'lar, GCP kaynaklarına erişim için kullanılan özel hesaplardır ve çeşitli hizmetler veya uygulamalar tarafından kimlik doğrulama ve yetkilendirme amacıyla kullanılır. Bu işlem, IAM & Admin paneli üzerinden gerçekleştirilir ve hesap için belirli izinlerin tanımlanmasını içerir.

## IAM & Admin Paneline Erişim

Google Cloud Console'da, sol taraftaki navigasyon menüsünden `IAM & Admin` seçeneğine tıklayın. Bu, Identity and Access Management (IAM) ayarlarınızı yönetebileceğiniz sayfaya yönlendirir.

## Yeni Service Account Oluşturma

**Service Accounts** menüsünü seçin ve ardından açılan sayfada **Create Service Account** butonuna tıklayarak yeni bir Service Account oluşturma işlemini başlatın.

## Service Account Detaylarını Belirleme

Oluşturmakta olduğunuz Service Account için aşağıdaki detayları girin:
    
- **Name**: Service Account için anlamlı ve tanımlayıcı bir isim belirleyin. Bu isim, hesabın amacını ve kullanımını yansıtmalıdır.
- **Description (Opsiyonel)**: Service Account'un amacını ve nerede kullanılacağını açıklayan kısa bir açıklama ekleyin.

## İzinlerin Atanması
  Service Account'a hangi GCP kaynaklarına erişebileceğini ve hangi işlemleri gerçekleştirebileceğini belirleyecek izinleri atayın. Bu, Service Account'un rolünü ve güvenlik politikalarınızla uyumunu sağlar.
  
  **Roles**: Service Account'a uygun rolleri atayın. Bu roller, hesabın GCP üzerinde hangi eylemleri gerçekleştirebileceğini belirler. Örneğin, bir Compute Engine VM'lerini yönetmek için gereken izinlere sahip bir rol seçebilirsiniz.

  
## Service Account Oluşturma
Tüm detayları girdikten ve gerekli izinleri atadıktan sonra, Create butonuna tıklayarak Service Account oluşturma işlemini tamamlayın.

IAM Service için örnek izinler aşağıda belirtilmiştir, en az ayrıcalık ilkesine dayanarak izin verebilirsiniz:

![iamservice](https://github.com/AEuphrates/Secure-and-Scalable-Web-Application/assets/155168172/e36d8d5f-5108-43d4-8529-6ea118d6ac29)

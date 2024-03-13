# PostgreSQL Instance Oluşturma Adımları

Bu belge, Google Cloud Platform (GCP) üzerinde özel bir Virtual Private Cloud (VPC) ağında çalışan bir PostgreSQL veritabanı örneği oluşturma sürecini adım adım açıklamaktadır. Süreç, SQL seçeneğinin navigasyon menüsünden seçilmesiyle başlar ve özel bir IP adresiyle yapılandırılmış bir PostgreSQL örneğinin oluşturulmasıyla sonlanır.

## SQL Hizmetine Erişim

Google Cloud Console'da, sol taraftaki navigasyon menüsünden **SQL** seçeneğine tıklayın. Bu, mevcut SQL örneklerinizi görüntüleyebileceğiniz ve yeni örnekler oluşturabileceğiniz sayfaya yönlendirir.

## Yeni Bir Instance Oluşturma

**Create Instance** butonuna tıklayarak yeni bir veritabanı örneği oluşturma işlemini başlatın. Bu, desteklenen veritabanı hizmetleri listesini gösterir.

## PostgreSQL Veritabanını Seçme

Sunulan veritabanı seçenekleri arasından **PostgreSQL**'i seçin. Bu seçim, PostgreSQL veritabanı örneğinizin yapılandırma seçeneklerini ayarlamanıza olanak tanır.

## Bölge Seçimi

Örneğin konumunu belirlemek için **Region** seçeneğinde, **Europe-west1** bölgesini seçin. Bu, örneğinizin fiziksel olarak Avrupa'nın batısında bulunan bir data merkezinde barındırılacağı anlamına gelir.

## Bölge Seçimi

**Show configurations** seçeneğine tıklayarak, veritabanı örneğiniz için daha detaylı yapılandırma seçeneklerini görüntüleyin.

### IP Yapılandırması

Veritabanı örneğiniz için IP adresi türünü seçin. Burada, daha güvenli bir bağlantı tipi olan **Private IP** seçeneğini belirleyin, böylelikle internet üzerinden doğrudan erişilemez.

### Ağ Seçimi

**Network** seçeneği altında, Terraform ile önceden oluşturulmuş olan my-vpc-network isimli VPC ağını seçin. Bu, PostgreSQL örneğinizin belirtilen VPC ağında çalışacağı ve bu ağ üzerindeki kaynaklarla iletişim kurabileceği anlamına gelir.

Aşağıdaki görselde bahsedilen adımların özetini görebilirsiniz:
![postgresql](https://github.com/AEuphrates/Secure-and-Scalable-Web-Application/assets/155168172/0831d8aa-f846-4997-9a97-d2c007c341e5)

Bahsedilmeyen diğer ayarları (CPU, Memory vs.), projenize göre değiştirebilirsiniz.

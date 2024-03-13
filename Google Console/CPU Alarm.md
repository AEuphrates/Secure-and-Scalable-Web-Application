# CPU Kullanımı İçin Alarm Politikası Oluşturma

Bu belge, Google Cloud Monitoring altında yer alan Alerting özelliği kullanılarak, belirli bir CPU kullanım eşiğinin aşılması durumunda uyarı tetikleyecek yeni bir alarm politikasının nasıl oluşturulacağını adım adım açıklamaktadır. Bu politika, projeyle uyumlu olarak CPU kullanımı belirli bir değere ulaştığında e-posta yoluyla bildirim gönderilmesini sağlar.

## Monitoring'e Erişim

Google Cloud Console'da, sol taraftaki navigasyon menüsünden **Monitoring** seçeneğine tıklayın. Bu, Cloud Monitoring hizmetlerine erişim sağlar.

## Alerting'e Gitme

Monitoring sayfasında, **Alerting** menüsüne gidin. Bu bölüm, mevcut alarm politikalarınızı görüntülemenize ve yeni politikalar oluşturmanıza olanak tanır.

## Yeni Alarm Politikası Oluşturma

**Create Policy** butonuna tıklayarak yeni bir alarm politikası oluşturma işlemine başlayın. Bu, politikanın ayrıntılarını belirlemenizi sağlayan bir yapılandırma sihirbazı başlatır.

##  Alarm Koşullarını Ayarlama

Alarm politikanız için aşağıdaki koşulları ayarlayın:
    
**Condition Type**: CPU kullanımını izlemek için uygun koşul tipini seçin. Bu, sisteminizin CPU kullanımının izlenmesini sağlar.
        
**Threshold**: CPU kullanım eşiği olarak `0.5` değerini girin. Bu, CPU kullanımı %50'nin (0.5 olarak ifade edilir) üzerine çıktığında bir uyarı tetiklenmesi anlamına gelir.

## Bildirim Kanalını Ayarlama

Alarm tetiklendiğinde bildirim almak için bir bildirim kanalı seçin. Bu örnekte, e-posta bildirimi kullanılacaktır:

**Notification Channel**: Mevcut bildirim kanalları listesinden e-posta seçeneğini seçin ve bildirim alınacak e-posta adresini girin.

## Alarm Politikasını Kaydetme

Tüm ayarları tamamladıktan sonra, **Save** veya **Create Policy** butonuna tıklayarak alarm politikanızı kaydedin ve etkinleştirin.

![cpu usage](https://github.com/AEuphrates/Secure-and-Scalable-Web-Application/assets/155168172/d950fc84-41c4-440c-b00a-53ac84344517)

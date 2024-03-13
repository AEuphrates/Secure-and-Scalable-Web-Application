# VM Instance Üzerinden SQL Database'e Erişim

Bu kılavuz, bir Google Cloud VM instance'ına SSH üzerinden nasıl bağlanılacağını ve PostgreSQL veritabanına nasıl erişileceğini adım adım açıklar. Süreç, `gcloud` CLI aracılığıyla kimlik doğrulama yapmayı, gerekli PostgreSQL istemcisini yüklemeyi ve ardından veritabanına bağlanmayı içerir.

##  SSH ile VM'ye Bağlanma

Google Cloud Console üzerinden veya `gcloud` CLI kullanarak VM instance'ınıza SSH ile bağlanın. Bu, komut satırı arayüzü üzerinden instance'ınıza erişmenizi sağlar.

##  Kimlik Doğrulama

VM içinde, Google Cloud hizmetlerine ve kaynaklarına erişim için `gcloud auth login` komutunu çalıştırarak kimlik doğrulama işlemini gerçekleştirin. Bu komut, bir kimlik doğrulama URL'si ve bir doğrulama kodu üretir. URL'yi bir web tarayıcısında açın ve kodu girerek kimlik doğrulama sürecini tamamlayın.

## PostgreSQL İstemcisini Kurma

PostgreSQL veritabanına bağlanabilmek için gerekli olan PostgreSQL istemcisini yüklemek üzere aşağıdaki komutları çalıştırın:

    sudo apt-get update
    sudo apt-get install postgresql-client
    
Bu komutlar, sisteminizi günceller ve PostgreSQL istemci yazılımını kurar.


## Veritabanına Bağlanma

PostgreSQL istemcisi kurulduktan sonra, aşağıdaki `psql` komutunu kullanarak PostgreSQL veritabanına bağlanın:
psql "host=10.73.240.2 sslmode=disable dbname=postgres user=postgres password=YourPassword"

    host=: Veritabanı sunucusunun IP adresi.
    
    sslmode=disable: SSL modunu devre dışı bırakır (Eğer veritabanınız SSL gerektiriyorsa bu seçeneği uygun şekilde ayarlayın).
    
    dbname=postgres: Erişmek istediğiniz veritabanının adı.
    
    user=postgres: Veritabanı kullanıcı adı.
    
    password=: Kullanıcının parolası.

Bu komut, belirtilen kullanıcı adı ve parola ile PostgreSQL veritabanına bağlantı kurmanızı sağlar.


![SQL SSH](https://github.com/AEuphrates/Secure-and-Scalable-Web-Application/assets/155168172/c63fe71d-9de5-4560-a6b6-586e3c807eeb)

Giriş yapıldığında buna benzer bir ekranın görülmesi gerekemektedir.


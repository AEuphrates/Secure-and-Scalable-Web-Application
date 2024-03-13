# Terraform main.tf file

Bu dosya, Google Cloud Platform üzerinde bir VPC ağı, bir alt ağ, bir sağlık kontrolü ve bir Google Storage bucket oluşturmak için Terraform kullanır. 

Projeyi başlatmak ve yönetmek için aşağıdaki adımları izleyin.

## Ön Koşullar

1- Google Cloud hesabı olmalı.
2- Terraform yüklü olmalı.

## Yapılandırma
1- Google Cloud projesi oluşturun veya mevcut bir projeyi kullanın.
2- `jsonfile.json` adında bir servis hesabı anahtarı dosyası oluşturun ve ilgili izinlere sahip olduğundan emin olun. Bu dosya, Terraform'un Google Cloud kaynaklarını yönetmek için kullanacağı kimlik bilgilerini içerir.

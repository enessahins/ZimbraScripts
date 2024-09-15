#!/bin/bash
  
# E-posta adreslerini içeren dosya
EMAILS_FILE="emails.txt"


# Her bir satırdaki e-posta adreslerini oku ve hesapları sil
while IFS= read -r EMAIL
do
  # E-posta hesabını sil
  zmprov DeleteDistributionList "$EMAIL"

  # Başarılı bir şekilde silindiğini kontrol et
  if [ $? -eq 0 ]; then
    echo "Başarıyla silindi: $EMAIL"
  else
    echo "Hata: $EMAIL hesabını silerken bir sorun oluştu!"
  fi
done < "$EMAILS_FILE"

echo "İşlem tamamlandı."

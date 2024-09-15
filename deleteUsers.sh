#!/bin/bash

# E-posta adreslerini içeren dosya
EMAILS_FILE="emails.txt"

# Dosyanın var olup olmadığını kontrol et
if [ ! -f "$EMAILS_FILE" ]; then
  echo "Hata: $EMAILS_FILE dosyası bulunamadı!"
  exit 1
fi

# Her bir satırdaki e-posta adreslerini oku ve hesapları sil
while IFS= read -r EMAIL
do
  # E-posta hesabını sil
  zmprov DeleteAccount "$EMAIL"

  # Başarılı bir şekilde silindiğini kontrol et
  if [ $? -eq 0 ]; then
    echo "Başarıyla silindi: $EMAIL"
  else
    echo "Hata: $EMAIL hesabını silerken bir sorun oluştu!"
  fi
done < "$EMAILS_FILE"

echo "İşlem tamamlandı."

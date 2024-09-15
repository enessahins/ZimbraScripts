#!/bin/bash
  
user_list_file="users.txt"

email_list_file="emails.txt"

# Yeni kota değeri (Byte cinsinden)
new_quota="524288000"

default_password='PassowrdHere**'

while IFS= read -r username && IFS= read -r email <&3; do
  email="${email}"

  zmprov ca "$email" "$default_password" displayName "$username"
  if [ $? -eq 0 ]; then
    echo "Kullanıcı hesabı oluşturuldu: $email"
  else
    echo "Hata: $email hesabı oluşturulurken bir hata oluştu."
  fi

# Kullanıcının posta kutusu kotasını değiştir
  zmprov modifyAccount "$email" zimbraMailQuota "$new_quota"
  if [ $? -eq 0 ]; then
    echo "kullanıcının posta kutusu kotası güncellendi: $email"
  else
    echo "hata: $email hesabının kotası güncellenirken bir hata oluştu."
  fi

done < "$user_list_file" 3< "$email_list_file"

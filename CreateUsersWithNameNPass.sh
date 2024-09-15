#!/bin/bash

user_list_file="users.txt"
email_list_file="emails.txt"
pass_list_file="passwords.txt"

# Yeni kota değeri (Byte cinsinden)
new_quota="524288000"

while IFS= read -r username && IFS= read -r email <&3 && IFS= read -r password <&4; do
  email="${email}"
  password="${password}"

  zmprov ca "$email" "$password" displayName "$username"
  if [ $? -eq 0 ]; then
    echo "Kullanıcı hesabı oluşturuldu: $email"
  else
    echo "Hata: $email hesabı oluşturulurken bir hata oluştu."
  fi

  # Kullanıcının posta kutusu kotasını değiştir
  zmprov modifyAccount "$email" zimbraMailQuota "$new_quota"
  if [ $? -eq 0 ]; then
    echo "Kullanıcının posta kutusu kotası güncellendi: $email"
  else
    echo "Hata: $email hesabının kotası güncellenirken bir hata oluştu."
  fi

done < "$user_list_file" 3< "$email_list_file" 4< "$pass_list_file"

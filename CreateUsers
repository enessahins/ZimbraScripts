#!/bin/bash


user_list_file="users.txt"

email_list_file="emails.txt"

default_password='Zimbra2023**'

while IFS= read -r username && IFS= read -r email <&3; do
  email="${email}"

  zmprov ca "$email" "$default_password" displayName "$username"
  if [ $? -eq 0 ]; then
    echo "Kullanıcı hesabı oluşturuldu: $email"
  else
    echo "Hata: $email hesabı oluşturulurken bir hata oluştu."
  fi
done < "$user_list_file" 3< "$email_list_file"

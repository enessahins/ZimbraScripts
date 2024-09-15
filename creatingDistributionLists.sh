#!/bin/bash


email_list_file="emails.txt"
user_list_file="users.txt"

while IFS= read -r username && IFS= read -r email <&3; do
  email="${email}"
  
# Dagitim listesi olusturuluyor
  zmprov cdl "$email"
  if [ $? -eq 0 ]; then
    echo "Dağıtım listesi oluşturuldu: $email"
  else
    echo "Hata: $email dağıtım listesi oluşturulurken bir hata oluştu."
  fi


# Dagitim listesinin adi guncelleniyor

  zmprov mdl "${email}" displayName "${username}"
  if [ $? -eq 0 ]; then
    echo "Dağıtım listesinin adı güncellendi"
  else
    echo "hata: $email dağıtım listesinin adı güncellenirken bir hata oluştu."
  fi
done < "$user_list_file" 3< "$email_list_file"

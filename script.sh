#!/bin/bash
while :
do 
#Get username, user password and home directory
IFS=" "
echo "Please type user name,user password and home directory"
read user_name user_password home_directory
echo "Please type user groups"
read -a groups
#Creating groups
for group in $groups
do
sudo groupadd $group
done
#Creating hash
hash=$(openssl passwd $user_password)
#Add user
sudo useradd -g "$groups" --home-dir "/home/$home_directory" --password "$hash" $user_name
#Check for adding a any users 
echo "Do you want add any users?(Y for continue, any symbol for exit)"
read answer
if [ "$answer" == "Y" ]
then
continue
else
break
fi
done


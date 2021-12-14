#!/bin/bash
echo -e "\n"
echo "Enter1 - For Windows"
echo "Enter2 - For RHEL-Distro"
echo "Enter3 - For Ubuntu"
echo "Enter0 - For exit"
echo -e "\n"

osis=""
while [[ ! $osis =~ ^[0-3]{1} ]]; do
 read -p "Enter [0,1,2,3] " osis
done
echo -e "\n"
case $osis in
 1) echo "################################## You choosed Windows ##################################";osis=Windows;;
 2) echo "################################## You choosed RHEL-Distro ##################################";osis=RHEL-Distro;;
 3) echo "################################## You choosed Ubuntu ##################################";osis=Ubuntu;;
 0) echo "################################## Bye ##################################"; echo -e '\n'; exit 0;;
esac

echo -e "\n"
echo "Enter1 - Create new user for $osis"
echo "Enter2 - Delete existing user in $osis"
echo "Enter3 - Change user password in $osis"
echo "Enter0 - To exit"
echo -e "\n"

useroption=""
while [[ ! $useroption =~ ^[0-3]{1} ]]; do
 read -p "Enter [0,1,2,3] " useroption
done

echo -e "\n"
########################################### RHEL-Distro ###################################################
if [[ $osis == 'RHEL-Distro' ]] && [[ $useroption -eq 1 ]]; then
   read -p 'Enter new username - ' newusername
   egrep "^$newusername" /etc/passwd >/dev/null
   if [ $? -eq 0 ]; then
		echo "$newusername exists!"
		exit 1
   else
   useradd $newusername 
   read -s -p 'Enter password - ' newuserpassword 
   echo "$newusername:$newuserpassword" | chpasswd 
   echo -e '\n' 
   echo "$newusername User Created Successfully!!" 
   echo -e '\n' 
   read -p 'To give this user admin privileges press y|n ' want
   case $want in
   y) usermod -aG wheel $newusername;
      id $newusername
      echo "$newusername" is added to sudo group;
      echo -e '\n';
   ;;
   esac   
   fi
elif [[ $osis == 'RHEL-Distro' ]] && [[  $useroption -eq 3 ]]; then
   read -p 'enter username to change its passowrd - ' changeuser
   id $changeuser
   if [ $? -eq 0 ]; then
      read -s -p 'enter new password - ' changedpassword
      echo "$changeuser:$changedpassword"  | chpasswd
      echo "New password Updated Successfully !!"
   else
      echo "$changeuser does not exists!"
      exit 1
   fi
     
elif [[ $osis == 'RHEL-Distro' ]] && [[ $useroption -eq 2 ]]; then 
   read -p 'Enter Username to delete - ' deleteuser
   userdel -fr $deleteuser
  # echo "$deleteuser is successfully deleted!!"
   id $deleteuser
   
##################################################  Ubuntu  #######################################################




################################################## Windows ########################################################


###################################################################################################################
elif [[ $useroption -eq 0 ]]; then
   echo "############################################ Bye ############################################"
   echo -e "\n"
   exit 0

fi

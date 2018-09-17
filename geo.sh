#!/bin/bash

awal() {
   echo -e "\e[32;1m =================================== \e[0m"
   echo -e "\e[32;1m ======== jago-tekno.com =========== \e[0m"
   echo -e "\e[32;1m =================================== \e[0m"
}

root () {
	if [[ $EUID -ne 0 ]]; then
		echo -e "\e[31;1m Please,Use ROOT user \e[0m"
		exit 1
	fi
}
cek(){
	which jq > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e "\e[31;1m Jq -----------------------  \e[32;1m [OK] \e[0m"
       else
       	
       	echo ""
       	echo "DO U WANT INSTALL jq ? (YES|NO) "
       	read jawaban
       	if [[ $jawaban="YES" ]]; then
       		apt-get update
       		apt-get install jq
       	else	
       		exit
       	fi
       	fi
       	sleep 1
  which curl > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e "\e[31;1m curl -----------------------  \e[32;1m [OK] \e[0m"
       else
       	
       	echo ""
       	echo "DO U WANT INSTALL curl ? (YES|NO) "
       	read jawaban
       	if [[ $jawaban="YES" || $jawaban="yes" || $jawaban="y" || $jawaban="" ]]; then
       		apt-get update
       		apt-get install curl
       	else	
       		exit
       	fi
       	fi
       	sleep 1
}

fungsi () {
	read -p "[+] Target	: " target

url= curl 'http://ip-api.com/json/'$target'?fields=520191&lang=en' > $target.tmp && clear && cat $target.tmp | jq '.'
}


awal
sleep 2
root
cek
clear
fungsi
sleep 5

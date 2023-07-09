#!/bin/bash

#Installs all required packages and repositories from text files.

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

clear

#Make Banner
printf "${Yellow}"
figlet -f slant 'Simple Install'
echo "Install all required packages and repositories from text files"
printf "${Color_Off}"

sleep 0.5

echo -e "By ${Red} Mr.Wasp \nStarting..,${Color_Off}\n"

sleep 0.5


#Looking for Packages


function packages(){
echo -e "${Yellow}Checking for packages...${Color_off}"
sleep 0.5

for i in $(cat packages.txt); do
	echo -e "${Yellow}Checking for ${i}...${Color_Off}"
	sleep 0.5
	PKG_CHECK=$(dpkg-query -W --showformat='${Status}\n' ${i}|grep "install ok installed")
	if [ "install ok installed" = "$PKG_CHECK" ]; then
		echo -e "${Green} ${i} already exists. ${Color_Off}"
	fi
	if [ "" = "$PKG_CHECK" ]; then
		echo -e "${Red}${i} is not installed! Installing...${Color_Off}"
		pkg install ${i}
	fi
	sleep 1
done

echo -e "${Green}All packages satisfied (If you encountered any errors prior to this message, please post an issue at the Github repo. Or install the package manually)'${Color_Off}"
}


sleep 0.5


#Looking for repositories

function repositories(){

echo -e "\n${Yellow}Checking for repositories...${Color_Off}"
sleep 0.5



for repo in $(cat repositories.txt); do
	echo -e "${Yellow}Cloning ${repo}...${Color_Off}"
	git clone ${repo}
	echo "Done"
	sleep 1
done

echo -e "${Green}All GitHub repositories satisfied."
}



#Run for-loop for packages and repositories.
#Also checks whether the file exists first.

function loop(){
if [ -e ${1}.txt ]; then
	echo -e "\n${Green}The file ${1}.txt detected. Running for-loop.${Color_Off}"
	#Run the function needed for either process. The file variable is the function name to run.
	${1}
else
	echo -e "${Red}WARNING!: Required file(${1}.txt) not found. Please check for typographical errors on the file, or check if it is in current working directory.${Color_Off}"
	exit
fi

sleep 1
}

loop packages
loop repositories


#Final warnings

echo -e "${Green}Everything is good to go!\n"


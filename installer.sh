#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emil237/m3uplayer/main/installer.sh -O - | /bin/sh

#lock=mkmlw12345

#software_updates=New look,improve performance

#builddate=2007-2020

#last_update=

version=3.1

######

last_update= 

######

LINE='----------------------------------------------------'



# remove old version

rm -rf /usr/lib/enigma2/python/Plugins/Extensions/m3uPlayer

# Download and install plugin



cd /tmp 

set -e

wget "https://raw.githubusercontent.com/emil237/m3uplayer/main/m3uPlayer-"$version".tar.gz"



tar -xzf m3uPlayer-"$version".tar.gz -C /

set +e

rm -f m3uPlayer-"$version".tar.gz

opkg update

opkg install python-requests


# Download last updates

	echo $LINE

	echo "[ check and Downloading updates $last_update ..... ]"

	if [ -z "$last_update" ]; then 

		echo "[ No updates available ]"

	else

		wget  "https://raw.githubusercontent.com/emil237/m3uplayer/main/f02420182_1.1_update.tar.gz"

		tar -xzf f02420182_1.1_update.tar.gz -C /

cd ..

		rm -f /tmp/f02420182_1.1_update.tar.gz

	fi



sync

echo "#########################################################"

echo "#          m3uPlayer INSTALLED SUCCESSFULLY           #"

echo "#                      mfaraj57                          #"              

echo "#                      support                           #"

echo "# http://yassinov.com      https://www.tunisia-sat.com   #"

echo "##########################################################"

echo "#           your Device will RESTART Now                 #"

echo "#########################################################"

sleep 3

killall -9 enigma2

exit 0








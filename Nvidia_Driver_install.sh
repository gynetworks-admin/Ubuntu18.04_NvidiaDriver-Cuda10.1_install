dist=$(. /etc/os-release;echo $ID$VERSION_ID)
arch=$(dpkg -s libc6 | grep Architecture)

if [ ${dist//.} = ubuntu1804 ];then
	echo "Version : ${dist//.}"
else
	echo "support only Ubuntu 18.04"
	exit
fi

sudo ubuntu-drivers devices
read -p "Choose the driver number from the above {ex: 440}: " input

read -p "Do you want to install nvidia-driver-$input [y/n] " yn
case $yn in
	[Yy]* )	sudo apt-get purge nvidia*
		sudo add-apt-repository ppa:graphics-drivers/ppa
		sudo apt-get update
		sudo apt-get install -y --no-install-recommends nvidia-driver-$input;;
	[Nn]* ) exit;;
esac

echo ""
echo "install cuda10.1"

if [ ${arch:14} = amd64 ];then
	an_arch="x86_64"
else
	echo "32bit is not support"
	exit
fi

wget https://developer.download.nvidia.com/compute/cuda/repos/${dist//.}/$an_arch/cuda-repo-${dist//.}_10.1.243-1_${arch:14}.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${dist//.}/$an_arch/7fa2af80.pub
sudo dpkg -i c
sudo apt-get update -y
wget http://developer.download.nvidia.com/compute/machine-learning/repos/${dist//.}/$an_arch/nvidia-machine-learning-repo-${dist//.}_1.0.0-1_${arch:14}.deb
sudo apt install -y ./nvidia-machine-learning-repo-${dist//.}_1.0.0-1_${arch:14}.deb
sudo apt-get update -y

sudo rm cuda-repo-${dist//.}_10.1.243-1_${arch:14}.deb
sudo rm nvidia-machine-learning-repo-${dist//.}_1.0.0-1_${arch:14}.deb

read -p "System reboot is required. Would you like to restart now? [y/n] " yn
case $yn in
	[Yy]* ) echo "System restarting"
		sudo reboot;;
	[Nn]* ) exit;;
esac


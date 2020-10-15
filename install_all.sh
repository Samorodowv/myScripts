echo -e "INSTALLING ALL PACKAGES Please comment line if don't requered"
sudo apt update -y && sudo apt upgrade -y
sudo apt install vim mc htop git -y

sudo chmod +x install_*

echo -e "INSTALLING DEB PACKAGES" 
./install_deps.sh


read -p "REMOVE OLD NVIDAI AND INSTALL NEW WITH CUDA (Y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "INSTALLING NVIDIA DRIVERS AND CUDA"
./install_nvidia.sh
fi


pylonhere="$(dpkg -s pylon | grep Status)"
echo
if [[ $pylonhere == *"installed"* ]]
then
	echo "PYLON ALREADY INSTALLED"
else
        echo "INSTALLING PYPYLON"
./install_pylon.sh
fi


read -p "COMPILE NEW OPENCV VERSION FROM SOURCE(Y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./install_opencv.sh
fi


read -p "INSTALL SOCKETCAN (Y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./install_j1939.sh
fi

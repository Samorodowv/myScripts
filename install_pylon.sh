if [ "$(uname -m)" == "x86_64" ]; then
	wget -O pylon.deb https://www.baslerweb.com/fp-1589378344/media/downloads/software/pylon_software/pylon_6.1.1.19861-deb0_amd64.deb 
else
	wget -O pylon.deb https://www.baslerweb.com/fp-1594648231/media/downloads/software/pylon_software/pylon_6.1.3.20159-deb0_arm64.deb
fi
sudo dpkg -i pylon.deb
rm pylon.deb

sudo apt install -y swig
sudo cp -r /opt/pylon/ /opt/pylon5

git clone https://github.com/basler/pypylon.git
cd pypylon
pip3 install .
cd ..
rm -rf pypylon

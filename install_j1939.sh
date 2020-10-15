sudo apt install libgtest-dev protobuf-compiler libprotobuf-dev libncurses-dev libwebsockets-dev libgtest-dev cmake -y
cd /usr/src/gtest
sudo env "PATH=$PATH" cmake CMakeLists.txt
sudo make
sudo cp *.a /usr/lib

git clone https://github.com/open-source-parsers/jsoncpp.git
cd jsoncpp
git checkout 863aa36165acfdbaf22447f4934f5adc327692a0
cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON
sudo make install
cd ~
git clone https://github.com/famez/J1939-Framework.git
cd J1939-Framework
cmake .
cmake --build .
sudo make install
pip3 install j1939
cd ~

mkdir ~/git_builds
cd ~/git_builds
git clone https://github.com/opencv/opencv.git
cd opencv
git clone https://github.com/opencv/opencv_contrib.git
mkdir build
cd build
cmake   -D CMAKE_INSTALL_PREFIX=/usr/local \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D WITH_CUDA=ON \
	-D OPENCV_DNN_CUDA=ON \
	-D CUDA_HOST_COMPILER=/usr/bin/gcc-7 \
	-D WITH_QT=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules/ \
	-D WITH_OPENGL=ON \
	-D WITH_TBB=ON \
	-D BUILD_TESTS=OFF ..

make -j$(nproc)
sudo make install
sudo ldconfig

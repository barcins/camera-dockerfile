FROM nvidia/cuda:12.5.0-runtime-ubuntu22.04
RUN apt-get update && apt -y install curl gnupg libgl1-mesa-glx libglib2.0-0 && rm -rf /var/lib/apt/lists/*
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list 
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && apt-get update && apt-get install -y python3-tflite-runtime && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt /
RUN pip install -r /requirements.txt
COPY . /app/
CMD ["python", "camera.py"]


# # Build arguments  
# ARG UBUNTU_RELEASE_YEAR
# ARG ZED_SDK_MAJOR
# ARG ZED_SDK_MINOR
# ARG CUDA_MAJOR
# ARG CUDA_MINOR

# # Specify the parent image from which we build
# FROM stereolabs/zed:${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-gl-devel-cuda${CUDA_MAJOR}.${CUDA_MINOR}-ubuntu${UBUNTU_RELEASE_YEAR}.04

# # OpenCV Version 
# ARG OPENCV_VERSION

# # Install dependencies
# RUN apt-get update || true && apt-get upgrade -y &&\
#     # Install build tools, build dependencies and python
#     apt-get install --no-install-recommends -y \
# 	build-essential gcc g++ \
# 	cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
# 	libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev \
#     yasm libatlas-base-dev gfortran libpq-dev \
#     libxine2-dev libglew-dev libtiff5-dev zlib1g-dev libavutil-dev libpostproc-dev \ 
#     libeigen3-dev python3-dev python3-pip python3-numpy libx11-dev tzdata \
# && rm -rf /var/lib/apt/lists/*

# # Set Working directory
# WORKDIR /opt


# # Install OpenCV from Source
# RUN git clone --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv.git && \
#     git clone --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv_contrib.git && \
#     cd opencv && \
#     mkdir build && \
#     cd build && \
#     cmake \
# 	-D CMAKE_BUILD_TYPE=RELEASE \
# 	-D CMAKE_INSTALL_PREFIX=/usr/ \
# 	-D PYTHON3_PACKAGES_PATH=/usr/lib/python3/dist-packages \
# 	-D WITH_V4L=ON \
# 	-D WITH_QT=OFF \
# 	-D WITH_OPENGL=ON \
# 	-D WITH_GSTREAMER=ON \
# 	-D OPENCV_GENERATE_PKGCONFIG=ON \
# 	-D OPENCV_ENABLE_NONFREE=ON \
# 	-D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
# 	-D INSTALL_PYTHON_EXAMPLES=OFF \
# 	-D INSTALL_C_EXAMPLES=OFF \
# 	-D BUILD_EXAMPLES=OFF .. && \
#    make -j"$(nproc)" && \
#    make install

# # ALternatively, Install from Ubuntu Repository
# ###
# #RUN apt-get update -y || true && \
# #	DEBIAN_FRONTEND=noninteractive apt-get install -y   && \
# #	apt-get install -y --no-install-recommends libopencv-dev && \
# #   rm -rf /var/lib/apt/lists/* && apt autoremove && apt clean
# ###

# WORKDIR /

# CMD ["bash"]


# FROM ubuntu:20.04
# # FROM debian:bullseye-slim AS build-native-env

# ARG TARGETPLATFORM
# ENV DEBIAN_FRONTEND=noninteractive
# ENV OPENCV_VER 3.3.0


# # 4.7.0: 8 December 2023
# # https://github.com/opencv/opencv/releases/tag/4.7.0
# ENV OPENCV_VERSION=4.7.0



# RUN mkdir /my_ws
# WORKDIR /my_ws
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
#     apt-utils \
#     apt-transport-https \
#     software-properties-common \
#     wget \
#     unzip \
#     openssl \
#     cmake \
#     ca-certificates \
#     build-essential \
#     git 
# # RUN ninja-build \
# #       libtbb-dev \
# #       libatlas-base-dev \
# #       libgtk2.0-dev \
# #       libavcodec-dev \
# #       libavformat-dev \
# #       libswscale-dev \
# #       libxine2-dev \
# #       libv4l-dev \
# #       libtheora-dev \
# #       libvorbis-dev \
# #       libxvidcore-dev \
# #       libopencore-amrnb-dev \
# #       libopencore-amrwb-dev \
# #       libopenjp2-7-dev \
# #       libavresample-dev \
# #       x264 \
# #       libtesseract-dev \
# #       libdc1394-22-dev \
# #       libgdiplus    

# # RUN apt-get update && apt-get install -y libglib2.0-0 libgl1-mesa-glx
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libjpeg-dev python3 python3-pip python3-opencv python3-numpy

# # Setup OpenCV and opencv-contrib sources using the specified release.
# RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && \
#     unzip ${OPENCV_VERSION}.zip && \
#     rm ${OPENCV_VERSION}.zip && \
#     mv opencv-${OPENCV_VERSION} opencv
# RUN wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip && \
#     unzip ${OPENCV_VERSION}.zip && \
#     rm ${OPENCV_VERSION}.zip && \
#     mv opencv_contrib-${OPENCV_VERSION} opencv_contrib

# # https://www.tomshardware.com/how-to/raspberry-pi-facial-recognition gösterilen kütüphaneler
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install cmake build-essential pkg-config git libjpeg-dev libtiff-dev libpng-dev libwebp-dev libopenexr-dev \
# libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev \
# libgtk-3-dev python3-pyqt5 \
# libatlas-base-dev liblapacke-dev gfortran \
# libhdf5-dev libhdf5-103	\
# python3-dev python3-pip python3-numpy


# # Download OpenCvSharp to build OpenCvSharpExtern native library
# RUN git clone https://github.com/shimat/opencvsharp.git
# RUN cd opencvsharp && git fetch --all --tags --prune && git checkout ${OPENCVSHARP_VERSION}
    
# # cmake and build OpenCV optinally specying architecture related cmake options.
# RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules-D ENABLE_NEON=ON -D ENABLE_VFPV3=ON \
#     -D BUILD_TESTS=OFF \
#     -D INSTALL_PYTHON_EXAMPLES=OFF \
#     -D OPENCV_ENABLE_NONFREE=ON \
#     -D CMAKE_SHARED_LINKER_FLAGS=-latomic \
#     -D BUILD_EXAMPLES=OFF .. &> cmake.log
# RUN make -j4 &> make.log
# RUN make install &> make-install.log
# RUN ldconfig
    
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libglib2.0-0 libgl1-mesa-glx   

# # python pip install
# RUN wget https://bootstrap.pypa.io/get-pip.py
# RUN python3 get-pip.py
# RUN python3 -m pip install --upgrade pip





# WORKDIR mkdir /opencvsharp/src
# WORKDIR /my_ws
# COPY . /my_ws
# # Install the Python dependencies on the virtual environment

# RUN pip3 install opencv-python 


# # RUN pip install -r requirements.txt --root-user-action=ignore

# # python kütüphaneleri https://www.tomshardware.com/how-to/raspberry-pi-facial-recognition
# RUN python3 -m pip install face-recognition
# RUN python3 -m pip install imutils
# #RUN python3 -m pip install opencv-contrib-python-headless
# RUN python3 -m pip install numpy 
# RUN python3 -m pip install scipy
# # ekstra kütüphaneler
# RUN python3 -m pip install icecream
# RUN python3 -m pip install cmake
# RUN python3 -m pip install wheel
# RUN python3 -m pip install dlib --verbose


# #RUN python3 -m pip install opencv-contrib-python==4.1.0.25
# # Copy the library and dependencies to /artifacts (to be used by images consuming this build)
# # cpld.sh will copy the library we specify (./libOpenCvSharpExtern.so) and any dependencies
# #    to the /artifacts directory. This is useful for sharing the library with other images
# #    consuming this build.

# # RUN mkdir /my_ws
# # WORKDIR /my_ws
# # Copy requirements.txt to the working directory
# # Install the Python dependencies on the virtual environment
# CMD ["python3", "camera.py"]
# #RUN chsh -s ~/.bashrc
# #ENV SHELL /bin/bash





# RUN apt-get update && apt-get install -y libprotobuf-dev protobuf-compiler

# RUN apt-get update \
#     && DEBIAN_FRONTEND=noninteractive apt-get install -y \
#         python3-pip \
#         python3-opencv \
#         python3-scipy \
#         python3-matplotlib \
#     && ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
#     && dpkg-reconfigure --frontend noninteractive tzdata \
#     && rm -rf /var/lib/apt/lists/* \
#     cmake build-essential pkg-config git \
#     libjpeg-dev libtiff-dev libjasper-dev libpng-dev libwebp-dev libopenexr-dev	\
#     libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev \
#     libgtk-3-dev libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5 \
#     libatlas-base-dev liblapacke-dev gfortran \
#     libhdf5-dev libhdf5-103	\
#     python3-dev python3-pip python3-numpy \
#     make \
#     build-essential \
#     cmake build-essential pkg-config \
#     libjpeg-dev libtiff-dev libjasper-dev libpng-dev libwebp-dev libopenexr-dev \
#     libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev \
#     libgtk-3-dev libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5 \
#     libatlas-base-dev liblapacke-dev gfortran \
#     libhdf5-dev libhdf5-103 
    
    
# RUN apt-get update && apt-get upgrade -y && apt-get install -y git

# RUN apt-get update && apt-get -y install cmake protobuf-compiler nvidia-docker2

# apt-get update && apt-get -y install cmake protobuf-compiler nvidia-docker2


# COPY camera.py /app/camera.py

# RUN mkdir /my_ws
# WORKDIR /my_ws
# # clone opencv
# RUN git clone https://github.com/opencv/opencv.git
# # clone opencv_contrib
# RUN git clone https://github.com/opencv/opencv_contrib.git
# # build opencv
# WORKDIR /my_ws/opencv
# RUN  mkdir -p /my_ws/opencv/build
# WORKDIR /my_ws/opencv/build
# RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") -D PYTHON3_EXECUTABLE=$(which python3) -D PYTHON_DEFAULT_EXECUTABLE=$(which python3) -D WITH_GTK=ON -D WITH_FFMPEG=ON -D BUILD_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D INSTALL_PYTHON_EXAMPLES=ON -D HAVE_opencv_python3=ON .. &> cmake.log


# RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules-D ENABLE_NEON=ON -D ENABLE_VFPV3=ON \
# 	-D BUILD_TESTS=OFF \
#     -D INSTALL_PYTHON_EXAMPLES=OFF \
#     -D OPENCV_ENABLE_NONFREE=ON \
# 	-D CMAKE_SHARED_LINKER_FLAGS=-latomic \
# 	-D BUILD_EXAMPLES=OFF .. &> cmake.log
# RUN make -j4 &> make.log
# RUN make install &> make-install.log

# RUN python3 -m pip install face-recognition
# RUN python3 -m pip install imutils  

# WORKDIR /my_ws



# # Copy the Python script into the container

# # Set the working directory
# WORKDIR /app

# # Run the Python script
# CMD ["python3", "camera.py"]

# # docker build -t video-stream-app .
# # docker run --device /dev/video0:/dev/video0 --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix video-stream-app
# # docker run -v /dev/bus:/dev/bus:ro -v /dev/serial:/dev/serial:ro -i -t --entrypoint /bin/bash ubuntu
# # docker run -v /dev/bus:/dev/bus:ro -v /dev/serial:/dev/serial:ro -i -t --entrypoint /bin/bash video-stream-app



# # docker run -it ubuntu
# # docker run -it video-stream-app
# # docker run -it -v /home/noemi/Escritorio/contenedores/cont1:/home opencvcourses/opencv-docker
# docker run -it video-stream-app sh
# docker run -it webcam bash


# '
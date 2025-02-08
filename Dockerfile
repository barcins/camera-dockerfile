FROM python:3
# Set the working directory to $APP_USER_HOME
RUN apt-get update -y

RUN apt-get install -y build-essential cmake git libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev 

COPY . /app

WORKDIR /app 

RUN pip install -r requirements.txt
# RUN mkdir /my_ws
# WORKDIR /my_ws
# Copy requirements.txt to the working directory
# Install the Python dependencies on the virtual environment
CMD ["python3", "camera.py"]
#RUN chsh -s ~/.bashrc
#ENV SHELL /bin/bash





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



# '
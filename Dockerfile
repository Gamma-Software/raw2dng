FROM ubuntu
CMD uname -m

COPY . /app
WORKDIR /app
RUN apt-get update && apt-get install -y \
    cmake \
    gcc \
    g++ \
    libexiv2-dev \
    libraw-dev \
    libexpat-dev \
    libjpeg-dev \
    zlib1g-dev
RUN mkdir build && cd build && cmake ../ && make && make install
# Clean the image
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
ENTRYPOINT [ "raw2dng" ]
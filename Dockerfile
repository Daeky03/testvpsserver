# Base image olarak Ubuntu 20.04 kullanıyoruz
FROM ubuntu:20.04

# Gerekli paketleri yükleyip güncellemeler yapıyoruz
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    cmake \
    build-essential \
    libjson-c-dev \
    libwebsockets-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# `ttyd`'yi yüklemek için kaynak kodunu indirip derliyoruz
RUN wget https://github.com/tsl0922/ttyd/archive/refs/tags/1.6.0.tar.gz -O ttyd.tar.gz && \
    tar xf ttyd.tar.gz && \
    cd ttyd-1.6.0 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

EXPOSE 7681
# `ttyd`'yi çalıştırmak için gerekli komut
CMD ["ttyd", "-p", "7681", "bash"]

# Web terminali port 7681 üzerinden erişilebilir olacak


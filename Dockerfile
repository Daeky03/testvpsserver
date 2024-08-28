# Base image olarak Ubuntu kullanıyoruz
FROM ubuntu:20.04

# Paket listesi güncellenir ve gerekli paketler yüklenir
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    build-essential \
    cmake \
    git \
    libjson-c-dev \
    libwebsockets-dev \
    && apt-get clean

# ttyd kaynak kodunu klonlayıp kurulum yapıyoruz
RUN git clone https://github.com/tsl0922/ttyd.git /opt/ttyd \
    && cd /opt/ttyd \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install

# ttyd komutunu root kullanıcısı ile çalıştırıyoruz
CMD ["ttyd", "-p", "7681", "-u", "root", "/bin/bash"]

# ttyd web terminali port 7681 üzerinden erişilebilir olacak
EXPOSE 7681

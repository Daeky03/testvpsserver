# Base image olarak Ubuntu 20.04 kullanıyoruz
FROM ubuntu:20.04

# Zaman dilimi ayarlamaları ve gerekli paketlerin yüklenmesi
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    nodejs \
    npm \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# `tty.js`'yi yüklemek için gerekli Node.js paketlerini yükleyelim
RUN npm install -g tty.js
EXPOSE 7681
# `tty.js`'yi çalıştırmak için gerekli komut
CMD ["tty.js", "--port", "7681", "--command", "bash"]

# Web terminali port 7681 üzerinden erişilebilir olacak


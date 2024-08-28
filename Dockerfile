# Base image olarak Ubuntu kullanıyoruz
FROM ubuntu:latest

# Paket listesi güncellenir ve gerekli paketler yüklenir
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    nodejs \
    npm \
    && apt-get clean

# Web terminali için gerekli Node.js paketlerini yükleyelim
RUN npm install -g wetty

# Web terminalini root kullanıcısı ile çalıştırıyoruz
CMD ["wetty", "--port", "7681", "--command", "bash"]

# Web terminali port 7681 üzerinden erişilebilir olacak
EXPOSE 7681

# Base image olarak Ubuntu kullanıyoruz
FROM ubuntu:latest

# Paket listesi güncellenir ve gerekli paketler yüklenir
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    shellinabox \
    && apt-get clean

# Shellinabox servisini başlat
CMD ["shellinaboxd", "--no-beep", "--background", "--port", "7681"]

# Shellinabox web terminali port 7681 üzerinden erişilebilir olacak
EXPOSE 7681

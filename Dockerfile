# Base image olarak Ubuntu kullanıyoruz
FROM ubuntu:latest

# Paket listesi güncellenir ve gerekli paketler yüklenir
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    tar \
    gcc \
    make \
    && apt-get clean

# Go'yu yükleyip, gotty'yi kuruyoruz
RUN wget https://dl.google.com/go/go1.20.6.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.20.6.linux-amd64.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin \
    && go install github.com/yudai/gotty@latest

# Go'yu PATH'e ekliyoruz
ENV PATH="/root/go/bin:${PATH}"

# Gotty'yi çalıştırıyoruz
CMD ["gotty", "-p", "7681", "bash"]

# Web terminali port 7681 üzerinden erişilebilir olacak
EXPOSE 7681

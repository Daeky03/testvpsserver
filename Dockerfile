# Base image olarak Ubuntu 20.04 kullanıyoruz
FROM ubuntu:20.04

# Zaman dilimi ayarlamalarını ve gerekli paketlerin yüklenmesini yapıyoruz
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    build-essential \
    libssl-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Go'yu yükleyip `gotty`'yi kuruyoruz
RUN wget https://dl.google.com/go/go1.20.6.linux-amd64.tar.gz -O go.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin && \
    go install github.com/yudai/gotty@latest

# Go'yu PATH'e ekliyoruz
ENV PATH="/root/go/bin:${PATH}"

EXPOSE 3000
# `gotty`'yi çalıştırmak için gerekli komut
CMD ["gotty", "-p", "3000", "bash"]

# Web terminali port 7681 üzerinden erişilebilir olacak

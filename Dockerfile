# Base image olarak Ubuntu kullanıyoruz
FROM ubuntu:latest

# Gerekli paketleri yüklüyoruz
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    && mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd

# root kullanıcısına şifresiz sudo erişimi veriyoruz ve SSH yapılandırmasını yapıyoruz
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/Port 22/Port 2222/' /etc/ssh/sshd_config

# SSH servisi için ortam değişkeni ayarlıyoruz
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# SSH bağlantısı için gerekli portu açıyoruz
EXPOSE 2222

# SSH server'ı başlatıyoruz
CMD ["/usr/sbin/sshd", "-D"]

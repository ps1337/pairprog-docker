FROM ubuntu:latest

EXPOSE 22

ADD sshd_config /etc/ssh/sshd_config

RUN apt-get update && \
    apt-get -y install \
      openssh-server \
      tmux \
      curl \
      bash \
      vim \
      sudo

RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A
RUN adduser -shell /bin/bash pair
RUN mkdir /home/pair/.ssh && touch /home/pair/.ssh/authorized_keys
RUN chown -R pair:pair /home/pair
RUN usermod -aG sudo pair

CMD pw=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c50) && \
    echo "pair:$pw" | chpasswd && \
    echo $pw && \
    /usr/sbin/sshd -D

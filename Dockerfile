FROM solita/ubuntu-systemd:16.04

MAINTAINER vkill <vkill.net@gmail.com>

EXPOSE 22

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's!^#PasswordAuthentication yes!PasswordAuthentication no!' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

COPY sshdgenkeys.service /etc/systemd/system/
RUN chmod 664 /etc/systemd/system/sshdgenkeys.service
RUN systemctl enable sshdgenkeys.service

COPY sshd.service /etc/systemd/system/
RUN chmod 664 /etc/systemd/system/sshd.service
RUN systemctl enable sshd.service

RUN mkdir /root/.ssh && \
    touch /root/.ssh/authorized_keys && \
    chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/authorized_keys

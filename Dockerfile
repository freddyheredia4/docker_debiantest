FROM debian:stretch

LABEL VENDOR="Freddy Heredia"
LABEL Description="Base Debian Lista para Trabajar"


COPY resources/sources.list /etc/apt/

RUN echo 'root:123' | chpasswd

RUN apt -y update \
    && apt -y upgrade \
    && useradd -m ale \
    && echo 'ale:123' | chpasswd \
    && apt -y install openssh-server \
    && mkdir /var/run/sshd

#CMD ["/usr/sbin/sshd","-D"]
RUN mkdir /docker-entrypoint-initdb.d
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
#RUN cat docker-entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["bash","entrypoint.sh"]

EXPOSE 22


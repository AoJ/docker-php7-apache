FROM aooj/base:slim
MAINTAINER AooJ <aooj@n13.cz>

# you must disable chroot_deny_chmod in gr security due to apache2 suexec
# "ApplyLayer exit status 1 stdout:  stderr: chmod /usr/sbin/suexec: permission denied"
# solution sysctl -w kernel.grsecurity.chroot_deny_chmod=0

# if change user, you must change user in apache.conf TODO
ARG USER=apache
ARG USER_ID=1302
ENV USER_NAME=$USER  \
    TERM=xterm       \
    DB_HOST=""       \
    DB_PORT=""       \
    DB_NAME=""       \
    DB_USER=""       \
    DB_PASS=""

ADD files/install.sh /tmp/install.sh

RUN addgroup -g $USER_ID -S $USER                     \
 && adduser -S -D -H -u $USER_ID -G $USER $USER       \
 && /tmp/install.sh

ADD files/wordpress.sh /tmp/wordpress.sh
RUN /tmp/wordpress.sh

ADD files/apache2 /etc/apache2

VOLUME ["/var/www"]

EXPOSE 8080
CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
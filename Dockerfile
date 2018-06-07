FROM clearlinux
MAINTAINER byang1217@gmail.com

RUN swupd verify -fYb -m 22780 -F 25
RUN swupd bundle-add os-clr-on-clr os-utils-gui-dev web-server-basic scm-server java-basic os-utils-gui-dev
RUN mkdir -p /run/lock
RUN clrtrust generate
RUN mkdir -p /etc/ssh
RUN ssh-keygen -A

RUN echo -n "root:x:0:0:root:/root:/bin/bash" > /etc/passwd
COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]

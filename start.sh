#!/bin/bash -e

if [ -n "$DOCKER_START_FROM_URL" ]; then
	wget --no-check-certificate -O /tmp/start.sh "$DOCKER_START_FROM_URL"
	mv /tmp/start.sh /start.sh
	chmod +x /start.sh
	echo "done, please start container with: sudo docker start [container_name]"
else
	/usr/sbin/sshd -D
fi

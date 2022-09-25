FROM gabbottron/awscli:v0.1

WORKDIR /root

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

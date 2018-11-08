FROM hashicorp/packer:1.3.2
MAINTAINER "Contino APAC <delivery.au@contino.io>"

RUN apk add --update --no-cache make bash python3 && \
        pip3 install --upgrade pip && \
        pip3 install awscli

VOLUME [ "/opt/app" ]
WORKDIR /opt/app

CMD ["--version"]

FROM ubuntu:20.04

ENV AWSCLI_VERSION='1.18.69'

RUN apt-get -y update && \
    apt-get -y install zip python3-pip python3-venv

RUN python3 -m pip install awscli

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
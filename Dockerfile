FROM ubuntu:18.04

ENV TZ='America/New_York'
ENV DEBIAN_FRONTEND=noninteractive

ADD https://download.technitium.com/dns/DnsServerPortable.tar.gz /
ADD https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb /

RUN apt-get update && \
  apt-get install -y software-properties-common apt-utils && \
  add-apt-repository -y universe && \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y build-essential tzdata curl wget && \
  apt-get clean && \
  curl -sSL https://download.technitium.com/dns/install-ubuntu.sh | bash

WORKDIR /etc/dns
ENTRYPOINT ["sh", "./start.sh"]

FROM ubuntu:18.04

ENV TZ='America/Chicago'

ADD https://download.technitium.com/dns/DnsServerPortable.tar.gz /
ADD https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb /

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y universe && \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y dotnet-runtime-3.1 && \
  apt-get clean && \
  dpkg -i packages-microsoft-prod.deb && \
  mkdir -p /etc/dns/ && \
  tar -zxf DnsServerPortable.tar.gz -C /etc/dns/ && \
  rm /DnsServerPortable.tar.gz

WORKDIR /etc/dns
ENTRYPOINT ["sh", "./start.sh"]

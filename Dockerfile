FROM ubuntu:latest

MAINTAINER Sah Lee <contact@leesah.name>

ENV ECLIPSE_DOWNLOAD_URL http://download.eclipse.org/technology/epp/downloads/release/luna/SR1a/eclipse-java-luna-SR1a-linux-gtk-x86_64.tar.gz

RUN apt-get update \
 && apt-get install -y software-properties-common curl \
 \
 && apt-add-repository -y ppa:webupd8team/java \
 && apt-get update \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
 && apt-get install -y oracle-java8-set-default \
 \
 && curl "$ECLIPSE_DOWNLOAD_URL" | tar vxz -C /opt/ \
 && adduser --disabled-password --quiet --gecos '' eclipse \
 && chown -R root:eclipse /opt/eclipse \
 \
 && apt-get --purge autoremove -y software-properties-common curl \
 && apt-get clean

USER eclipse
ENTRYPOINT /opt/eclipse/eclipse

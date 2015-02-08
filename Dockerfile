FROM ubuntu:latest

MAINTAINER Sah Lee <contact@leesah.name>

ENV DOWNLOAD_URL http://download.eclipse.org/technology/epp/downloads/release/luna/SR1a/eclipse-java-luna-SR1a-linux-gtk-x86_64.tar.gz
ENV INSTALLATION_DIR /usr/local/ 

RUN apt-get update \
 && apt-get install -y software-properties-common curl \
 \
 && apt-add-repository -y ppa:webupd8team/java \
 && apt-get update \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
 && apt-get install -y oracle-java8-set-default \
 \
 && curl "$DOWNLOAD_URL" | tar vxz -C $INSTALLATION_DIR \
 && adduser --disabled-password --quiet --gecos '' eclipse \
 && chown -R root:eclipse $INSTALLATION_DIR/eclipse \
 %% chmod -R 775 $INSTALLATION_DIR/eclipse \
 \
 && apt-get --purge autoremove -y software-properties-common curl \
 && apt-get clean

USER eclipse
ENTRYPOINT INSTALLATION_DIR/eclipse/eclipse

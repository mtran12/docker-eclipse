FROM ubuntu:trusty

MAINTAINER Sah Lee <contact@leesah.name>

ENV DOWNLOAD_URL http://download.eclipse.org/technology/epp/downloads/release/mars/1/eclipse-java-mars-1-linux-gtk-x86_64.tar.gz
ENV INSTALLATION_DIR /usr/local

RUN apt-get update \
 && apt-get install -y software-properties-common curl \
 \
 && apt-add-repository -y ppa:webupd8team/java \
 && apt-get update \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
 && apt-get install -y oracle-java8-set-default libgtk2.0-0 libxtst6 \
 \
 && curl "$DOWNLOAD_URL" | tar vxz -C $INSTALLATION_DIR \
 \
 && apt-get --purge autoremove -y software-properties-common curl \
 && apt-get clean

RUN adduser --disabled-password --quiet --gecos '' eclipse
RUN chown -R root:eclipse $INSTALLATION_DIR/eclipse
RUN chmod -R 775 $INSTALLATION_DIR/eclipse

USER eclipse
ENTRYPOINT $INSTALLATION_DIR/eclipse/eclipse

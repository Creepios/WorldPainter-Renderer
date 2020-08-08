FROM debian:buster-slim

RUN apt update && apt install -y wget gnupg software-properties-common
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN mkdir -p /usr/share/man/man1
RUN apt update && apt install -y adoptopenjdk-8-hotspot-jre

RUN wget -O worldpainter.deb https://www.worldpainter.net/files/worldpainter_2.7.16.deb
RUN apt install -y ./worldpainter.deb
RUN mkdir /worldpainter/

VOLUME [ "/worldpainter" ]

COPY wp.js /
ENTRYPOINT /bin/bash -c "wpscript wp.js" && echo Successfully generated World

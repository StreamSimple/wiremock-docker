FROM alpine:3.7

# Install various packages
RUN apk update
RUN apk add sudo
RUN apk add wget
RUN apk add openjdk8

RUN wget http://mirror.reverse.net/pub/apache/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
RUN tar -zxvf apache-maven-3.5.3-bin.tar.gz

RUN ./apache-maven-3.5.3/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy -Dartifact=com.github.tomakehurst:wiremock-standalone:2.16.0 -DoutputDirectory=./

RUN mkdir mappings
COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh

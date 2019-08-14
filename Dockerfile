FROM debian:stable

RUN apt-get update
RUN apt-get install -y mongo-tools netcat

COPY ./json /json/
COPY ./wait-for-mongo.sh /wait-for-mongo.sh

RUN chmod 700 /wait-for-mongo.sh

ENTRYPOINT ["/bin/sh", "/wait-for-mongo.sh"]

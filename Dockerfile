FROM debian:buster

RUN apt-get update \

COPY ./srcs/init.sh

CMD ["bash", "init.sh"]
FROM lparet/docker-ubuntu-java8
LABEL Louis Paret <perso@louisparet.fr>

ENV TZ=Europe/Paris

## Install packages
RUN apt-get update \
	&& apt-get -y install \
		maven \
	&& apt-get clean \
	&& rm -fr /var/cache/apt/ \
	&& rm -rf /var/lib/apt/lists/*

# Http port
EXPOSE 8080

ADD ./config/ /

ENTRYPOINT [ "/entrypoint.sh" ]
FROM lsiobase/ubuntu:bionic

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION}-RAOUI Build-date:- ${BUILD_DATE}"
LABEL maintainer="raoui"

# environment settings
ENV HOME="/config"

#  "**** install node repo ****"
RUN \
 apt-get update && \
 apt-get install -y gnupg && \
 curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
 echo 'deb https://deb.nodesource.com/node_12.x bionic main' > /etc/apt/sources.list.d/nodesource.list && \
 curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
 echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# "**** install build dependencies ****"
RUN \
 apt-get update && \
 apt-get install -y \
	build-essential \
	libx11-dev \
	libxkbfile-dev \
	libsecret-1-dev \
	pkg-config

# "**** install runtime dependencies ****" 
RUN \
 apt-get install -y \
	git \
	jq \
	nano \
	net-tools \
	nodejs \
	sudo \
	yarn 

# "**** install code-server ****"
RUN \
 if [ -z ${CODE_RELEASE+x} ]; then \
	CODE_RELEASE=$(curl -sX GET "https://api.github.com/repos/cdr/code-server/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \ 
 yarn --production global add code-server@"$CODE_RELEASE" && \
 yarn cache clean && \
 ln -s /node_modules/.bin/code-server /usr/bin/code-server


# "**** clean up ****"
RUN \
 apt-get purge --auto-remove -y \
	build-essential \
	libx11-dev \
	libxkbfile-dev \
	libsecret-1-dev \
	pkg-config && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 8443

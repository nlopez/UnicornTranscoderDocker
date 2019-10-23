ARG PLEX_BUILD=1.18.0.1944-f2cae8d6b
ARG CODECS_BUILD=20fed83-2561
ARG EAE_VERSION=eae-69c1de6-41

FROM plexinc/pms-docker:${PLEX_BUILD}
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs build-essential
WORKDIR /opt

RUN curl https://codeload.github.com/UnicornTranscoder/UnicornLoadBalancer/tar.gz/v2.4.0 | tar xvzf -
RUN cd UnicornLoadBalancer-2.4.0 && \
  npm install

RUN curl https://codeload.github.com/UnicornTranscoder/UnicornTranscoder/tar.gz/v2.3.10 | tar xvzf -
RUN cd UnicornTranscoder-2.3.10 && \
  npm install && \
  npm run install

RUN curl https://codeload.github.com/UnicornTranscoder/UnicornFFMPEG/tar.gz/2.2.1 | tar xvzf -
RUN cd UnicornFFMPEG-2.2.1 && \
  npm install && \
  npm start && \
  cp -v './bin/Plex Transcoder-linux' '/usr/lib/plexmediaserver/Plex Transcoder'

RUN rm -vf '/usr/lib/plexmediaserver/Plex Relay'

COPY root/ /

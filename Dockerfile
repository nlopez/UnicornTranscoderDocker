FROM plexinc/pms-docker:1.18.0.1944-f2cae8d6b
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs build-essential
WORKDIR /opt
RUN curl https://codeload.github.com/UnicornTranscoder/UnicornLoadBalancer/tar.gz/v2.4.0 | tar xvzf -
RUN cd UnicornLoadBalancer-2.4.0
RUN npm install UnicornLoadBalancer-2.4.0
COPY root/ /

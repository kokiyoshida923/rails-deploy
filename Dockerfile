FROM ruby:2.7.6 AS nodejs

WORKDIR /tmp

RUN curl -LO https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.xz
RUN tar xvf node-v16.15.0-linux-x64.tar.xz
RUN mv node-v16.15.0-linux-x64 node

FROM ruby:2.7.6

COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

RUN apt-get update && apt-get install --no-install-recommends -y vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN bundle config set path vendor/bundle

CMD ["bash"]

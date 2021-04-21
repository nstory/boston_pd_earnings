FROM alpine:3.13
RUN apk add --no-cache make ruby-full ruby-dev build-base zlib zlib-dev aws-cli && \
    gem install roo --version 2.8.3 && \
    gem install pry
VOLUME /volume
WORKDIR /volume
ENTRYPOINT sh

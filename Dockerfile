
FROM alpine

WORKDIR /ciee

ENV CIEE_VERSION 0.8.29

EXPOSE 3000

RUN apk update && \
  apk add --no-cache openssl wget && \
  rm -rf /var/cache/apk/*

RUN wget https://github.com/reacherhq/check-if-email-exists/releases/download/v${CIEE_VERSION}/check_if_email_exists-x86_64-unknown-linux-musl.tar.gz \
    && tar -xvzf check_if_email_exists-x86_64-unknown-linux-musl.tar.gz

CMD ["./check_if_email_exists", "--http", "--http-host", "0.0.0.0"]
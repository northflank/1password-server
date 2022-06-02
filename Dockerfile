FROM ubuntu:latest

RUN apt-get update && apt-get install ca-certificates -y && update-ca-certificates

COPY entrypoint.sh entrypoint.sh
COPY --from=1password/connect-api:latest /bin/connect-api /bin/connect-api
COPY --from=1password/connect-sync:latest /bin/connect-sync /bin/connect-sync

RUN chmod +x entrypoint.sh
RUN chmod +x /bin/connect-api
RUN chmod +x /bin/connect-sync

EXPOSE 8080

CMD ./entrypoint.sh

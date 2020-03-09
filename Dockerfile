FROM nginx:latest

EXPOSE 80:80

RUN apt-get update && \
    apt-get install -y pandoc make cron

# install the Makefile
COPY ./Makefile /org2web/Makefile

# install the cron job
COPY cron-job /etc/cron.d/cron-job
RUN chmod 0644 /etc/cron.d/cron-job
RUN crontab /etc/cron.d/cron-job

WORKDIR /org2web
CMD make && \
    service cron start && \
    nginx -g 'daemon off;'

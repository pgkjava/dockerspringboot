FROM gradle:latest

ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle $APP_HOME

COPY src src

CMD [ "gradle", "bootRun" ]
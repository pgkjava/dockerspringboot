FROM gradle:latest

ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle $APP_HOME

COPY src src

RUN gradle bootJar

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build/libs /usr/share/nginx/html
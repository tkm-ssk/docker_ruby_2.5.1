FROM ruby:2.5.1

ENV APP_ROOT /my_app
ENV LOCAL_APP_ROOT ./my_app

RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev postgresql-client

RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD ${LOCAL_APP_ROOT}/Gemfile ${APP_ROOT}/Gemfile
ADD ${LOCAL_APP_ROOT}/Gemfile.lock ${APP_ROOT}/Gemfile.lock

RUN bundle install

ADD $LOCAL_APP_ROOT $APP_ROOT

FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /manager-github-api
COPY Gemfile /manager-github-api/Gemfile
COPY Gemfile.lock /manager-github-api/Gemfile.lock
RUN bundle install
COPY . /manager-github-api

EXPOSE 3000

FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client nodejs yarn

ENV APP_DIR /app/simple_blog

RUN mkdir -p /app/simple_blog
# WORKDIR $APP_DIR
# COPY Gemfile $APP_DIR/Gemfile
# COPY Gemfile.lock $APP_DIR/Gemfile.lock
# RUN bundle install
# COPY . $APP_DIR
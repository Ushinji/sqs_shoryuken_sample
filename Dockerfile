FROM ruby:2.5.1
ENV LANG C.UTF-8
ENV APP_ROOT=/app

RUN apt-get update -qq \
    &&  apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install --jobs=4

COPY . $APP_ROOT

CMD [ "bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

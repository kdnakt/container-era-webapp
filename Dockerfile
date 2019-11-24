FROM ruby:2.6.5

ENV APP_ROOT /app

WORKDIR $APP_ROOT

# install mysql client
RUN apt-get update && apt-get install -y default-mysql-client \
  --no-install-recommends && rm -rf /var/lib/apt/lists/*

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN \
  gem install bundler:2.0.2 && \
  bundle install && \
  rm -rf ~/.gem

ADD . $APP_ROOT

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]


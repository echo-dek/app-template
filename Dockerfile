FROM ruby:3.1.2

RUN apt-get -y update -y && apt-get -y upgrade && apt-get install -y build-essential curl git mariadb-client imagemagick memcached

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock /usr/src/app/
RUN bundle update --bundler
RUN bundle check || bundle install
COPY . /usr/src/app/

EXPOSE 3000

ENTRYPOINT ["./bin/run"]
CMD bundle exec puma

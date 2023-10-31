FROM docker.io/ruby:3.2.2-bullseye

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --system

ADD . /app

EXPOSE 4567

CMD ["rerun", "--background", "app.rb"]

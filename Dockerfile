FROM ruby:3.3.0
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /billinho
COPY Gemfile /billinho/Gemfile
COPY Gemfile.lock /billinho/Gemfile.lock
COPY . .
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

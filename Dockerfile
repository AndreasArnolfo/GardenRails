FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /my_starter_app
WORKDIR /my_starter_app
COPY Gemfile /my_starter_app/Gemfile
COPY Gemfile.lock /my_starter_app/Gemfile.lock
RUN bundle install
COPY . /my_starter_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

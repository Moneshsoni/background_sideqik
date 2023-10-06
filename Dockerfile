# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory in the container
WORKDIR /app

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies using Bundler
RUN gem install bundler && bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 for the Rails app
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
FROM ruby:3.2

# Install dependencies (MySQL client and development tools)
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfiles first to leverage Docker cache
COPY Gemfile* ./
RUN bundle install

# Copy the rest of the app
COPY . .

EXPOSE 3000


# Precompile assets and start the server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

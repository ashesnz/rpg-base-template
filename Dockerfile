FROM ruby:2.4

# Install NodeJS for NPM
RUN apt-get update && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update && apt-get install -y nodejs

# Make build & app directory and copy all local files
RUN mkdir /tmp/build
RUN mkdir /usr/app

COPY . /tmp/build
WORKDIR /tmp/build

# Build Vue app with dependencies for the frontend
RUN npm install
RUN npm run build

# Copy required applications files to app directory
RUN cp -R dist /usr/app/dist
RUN cp -R lib /usr/app/lib
RUN cp -R db /usr/app/db
COPY app.rb Gemfile Gemfile.lock /usr/app/
COPY bin/* /usr/app/bin/

WORKDIR /usr/app
RUN mkdir sql

# Install Ruby dependencies for the backend
RUN bundle install --without test development

# Remove build directory to reduce image size
RUN rm -rf /tmp/build

# Make application available
EXPOSE 8080
# CMD ["ruby", "app.rb", "-o", "0.0.0.0", "-p", "8080"]
FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get -qq update && \
    apt-get -qq -y install --no-install-recommends \
    nodejs graphviz build-essential libpq-dev postgresql-client apt-transport-https libopencv-dev && \
    rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /opt/application/current
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

### Install packages and gems
ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install

COPY . /opt/application/current


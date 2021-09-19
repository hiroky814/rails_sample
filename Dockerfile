FROM ruby:2.7.4

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get -qq update && \
  apt-get -qq -y install --no-install-recommends nodejs build-essential libpq-dev postgresql-client apt-transport-https && \
  apt-get clean && rm -rf /var/cache/apt/ && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

ENV APP_ROOT /opt/application/current
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY . /opt/application/current

### Install packages and gems
RUN bundle install

RUN yarn install --pure-lockfile

ENTRYPOINT ["sh", "./script/web_entrypoint.sh"]

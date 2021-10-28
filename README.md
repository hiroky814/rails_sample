# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby: 3.0.2

* System dependencies
Running with Docker on Mac OS.

* Configuration
- docker
- docker-compose
- mysql database server

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Environment
- RAILS_ENV: development/test/production
- RACK_ENV: development/test/production
- DB_NAME: Database name.
- DB_HOST: Host for database connection.
- DB_USER: User name for database connection.
- DB_PASSWORD: Password for database connection.

* Deployment instructions
1. Create a `.env` file in the root directory.
2. Execute the `docker-compose build` command.
3. Execute the `docker-compose up` command.
4. Connect to rails container. `docker exec -ti [container name] bash`
5. Create a database. `rails db:create`

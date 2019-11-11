# Welcome to the URL shortener API RoR back-end
## Description
This back-end project uses Ruby on Rails, Sidekiq and redis to create a small JSON API that enables users to create a new short URL or to see the top 100 most visited ones. 

_**Short code algorithm:**_ A random 10-digit token is generated that may contain A-Z, a-z, 0-9 characters. The records that match 1 or more characters of the token sequence are retrieved. If no record is found, only the first character of the token is taken as the short code. If records are found, a short code is generated taking one more character than the longest token found.

## Prerequisites
* _**Ruby:**_ Install version 2.6.3. It's recommended to use a version manager such as rbenv [https://github.com/rbenv/rbenv](https://github.com/rbenv/rbenv).
* _**Bundler:**_ Install version >= 2.0 [https://bundler.io/](https://bundler.io/).
* _**PostgreSQL:**_ Install and be sure that's running and listening in localhost port 5432 [https://www.postgresql.org/](https://www.postgresql.org/).
* _**Redis:**_  Install and be sure that's running and listening in localhost port 6379 [https://redis.io/](https://redis.io/)

## Setup
1. Create a file named config/local_env.yml

2. Create key pair values
    * DATABASE_NAME: '<your_database_name>' 
    * DATABASE_USERNAME: '<your_pg_username>'
    * DATABASE_PASSWORD: '<your_pg_password>'
    * FRONT_URL: 'http://localhost:3001/#/'

3. Open the command prompt in the cloned project directory and install the project dependencies:

        $ bundle install

4. Open the command prompt in the cloned project directory and create the database:

        $ rails db:create
        
5. In the command prompt run the database migrations:

        $ rails db:migrate
        
6. In the command prompt run the rails server:

        $ rails s -p 3001
        
7. In a new command prompt, run sidekiq:

        $ bundle exec sidekiq

8. You can access the services through API calls to  [http://localhost:3000](http://localhost:3000)

_**Note:**_ Project UI will work if the React front-end is already running locally in [http://localhost:3000](http://localhost:3000). 

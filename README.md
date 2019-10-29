# CSNow

CSNow is a web application implemented using Ruby on Rails + React + GraphQL to follow CSGO matches, tournaments, teams and players.

### Data

The data used to populate CSNow is scrapped from [HLTV](https://hltv.org) using a NodeJS app that you can see in `csnow/hltv/` directory.
The node app uses [gigobyte's HLTV library](https://github.com/gigobyte/HLTV) to get scrape the data and formats it into `jsons` stored in `csnow/hltv/data/`. With this data, we can run the rake task `upload_hltv_data` to upload the information to CSNow's database.

To automatically scrape and upload data, run `scripts/hltv_data.bash` and it will take care of that for you.

### Setting up the app

First, make sure you have the correct `ruby` installed. I recommend using [RVM](https://rvm.io):

1. `\curl -sSL https://get.rvm.io | bash -s stable`
2. `rvm install "ruby-2.6.5"`

Then, install `bundler`

1. `gem install bundler`

Install necessary gems

1. `bundle install`

Install [Node.js](https://nodejs.org/en/)

Install [yarn](https://yarnpkg.com/lang/en/)

1. `npm i -g yarn`

Install js packages

1. `yarn install`

If you are going to scrape data, install the node app dependencies:

1. `cd csnow/hltv`
2. `npm install`

Finally, install [redis](https://redis.io)

### Setting up the database

You must have [PostgreSQL](https://www.postgresql.org) installed.

Run:

1. `rails db:create`
2. `rails db:migrate`
3. `rails db:seed` to insert some data into the DB

### Running the app

Start redis:

1. `redis-server`

If you want rails to deal with everything, run

1. `rails s`

If you want to use `webpack-dev-server`, run

1. `yarn dev`
2. `rails s`

### Linting

Backend:

1. `rubocop .`

Frontend:

1. `yarn lint`

### Credits

This project is designed and implemented by `Manuel Puyol` exclusively for `MPCS 53001 - Databases` class from `UChicago`.

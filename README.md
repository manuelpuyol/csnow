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

### Opening the web page

Access `localhost:8080`. This should trigger the webpack compilation if you are not using `webpack-dev-server`, so it will take some time to open in the first build.

### Project requirements

- (0) have a form that allows you to search for a record by at least 3 different attributes. One of these attributes must be a string that searches for like matches. This entity or relation, must have a key that is a foreign key for at least one other table.

The home page lists Tournaments, where you can search by name (ILIKE), location (select one from dropdown) or start date after the selected.

- (1) short description (eg a title or name, something to distinguish the record)

Each tournament is showing their name, location, start and end dates. It also shows the number of participating teams. The list is also capped at 50 records using `LIMIT`.

- (2) a link to view and/or update the record

Click on the `View` button to get more info. Clicking on `Update` should open a modal with a small form of attributes to update.

- (3) a button or link to delete the record

Click on the `Delete` button and the tournament should be destroyed.

- (4) a link to view a list or table of all records from a foreign key relationship (this list does not have to give all attributes from the other relation, but must show at least 4 attributes)

When clicking on the `View` button on a tournament, you'll be redirected to a page which lists all the participating rosters, including their names, logos, placement and prize won at the tournament.
There is also a list of matches, which shows the two teams that played that match, the winner (in bold), the start and end dates of the match.

- (5) a link to create a new record that would appear in the list from the previous element.

Click on `Add match` to add a new match in the tournament (can only add matches between participating rosters). A match may be in the future, with one of the rosters TBD.

- (6) a link to create a new record that could appear in the search result.

Click on `Create Tournament`, that should open a modal with a small form to create a brand new tournament!

### Credits

This project is designed and implemented by `Manuel Puyol` exclusively for `MPCS 53001 - Databases` class from `UChicago`.

# CityFalcon Test App
Test App for CityFalcon
### Application 
* This test app shows BTC data using line chart (ChartJS).
* User have access to view 1 hour, 1 day, 1 week, 1 month and 1 year Data
* User can also do sutom search by using Input Date fields.
* Graph shows each minute price data for 1 hour and 1 day request
* Graph shows day end price value for 1 week, 1 month and 1 year
* User can see current price of BTC

#### Third Party Api 
* COINMARKET API is used to fetch latest price (https://pro-api.coinmarketcap.com/v1/cryptocurrency)

### Setup

```bash
git clone git@github.com:UmerFrooq/cityfalcon.git
cd cityfalcon
```

### Check your Ruby and rails version

```shell
ruby -v
```
The output should be like **ruby 3.2.0**

```shell
rails -v
```
The output should be like **Rails 7.0.4"**

### Install dependencies

Install [PostgreSQL](https://www.postgresql.org/download/)

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```
### Start Redis Server 

```shell
redis-server
```
### Start Sidekiq 

```shell
bundle exec sidekiq
```

### Server

```shell
rails s
```

### Rspec 

```shell
bundle exec rspec
```
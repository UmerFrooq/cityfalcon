# CityFalcon Test App
Test App for CityFalcon

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

### Server

```shell
rails s
```

### Rspec

```shell
bundle exec rspec
```
# README

This is a Ruby on Rails (API only) application which works like a RAST API backend and all responses are in JSON format. This app can easily be deployed/set-up on a Linux based server.

SQLite database is used for this application. Although, `Postgresql` is a better choice for an app which is fintech in nature. The app uses `ActiveRecord` as ORM and uses proper joins and indexes so data fetch does not overburden DB. For JSON response, I have used acts_as_api gem.

For listing api, like users and account list, pagination has not been implemented but can easily be done as base library, I built for this app, allow this.

I wrote basic test coverage (Unit Test) using RSpec gem.If needed, I will host this sample app on a web server and can demo it.

Follow the steps to setup/install on Linux or MacOs.
Unzip source code zip file and cd into project directory
```shell
$ bundle install
$ rails db:create db:migrate db:seed
$ rails s
```



### API endpoint

```shell
[GET] /v1/users
[GET] /v1/users/:id   
[GET] /v1/users/:user_id/accounts
[GET] /v1/users/:user_id/accounts/:id                                                                                                                         
[GET] /v1/accounts                                                                            
[GET] /v1/accounts/:id
```


### Source code files, you may like to review:

All the files under `app/models` directory

All files under `app/controllers` directory  

All files under `app/controllers/concerns` directory   


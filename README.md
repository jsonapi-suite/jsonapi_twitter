# Jsonapi Twitter

This is a sample application showing off [jsonapi-suite](https://jsonapi-suite.github.io/jsonapi_suite) usage. It is based on [this proposed standard for examples](https://github.com/json-api/json-api/issues/1098#issuecomment-249428159).

Tweets, users, and messages all have index/show endpoints and hypermedia
`links` to each other. In addition, tweets have full CRUD.

Please note the [request specs](https://github.com/jsonapi-suite/jsonapi_twitter/tree/master/spec/api) and [automatic swagger documentation](https://github.com/jsonapi-suite/jsonapi_twitter/blob/master/app/controllers/docs_controller.rb).

### Running

Clone this repository and:

* `bundle install`
* `bundle exec rake db:migrate && bundle exec rake db:seed`
* `bundle exec rails s`
* Visit `http://localhost:3000/users`

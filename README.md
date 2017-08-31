# Postman MTA

[![Build Status](https://semaphoreci.com/api/v1/igormalinovskiy/postman_mta/branches/master/shields_badge.svg)](https://semaphoreci.com/igormalinovskiy/postman_mta)
[![Code Climate](https://codeclimate.com/github/psyipm/postman_mta/badges/gpa.svg)](https://codeclimate.com/github/psyipm/postman_mta)
[![Gem Version](https://badge.fury.io/rb/postman_mta.svg)](https://badge.fury.io/rb/postman_mta)

Rails gem to easy integrate Postman to your application

This gem will add some routes to the application to forward requests from frontend to postman API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postman_mta'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postman_mta

## Usage

Mount engine in `config/routes.rb`:

```ruby
mount PostmanMta::Engine => '/mta'
```

Then configure the gem:

```ruby
# config/initializers/postman_mta.rb
PostmanMta.setup do |config|
  config.api_key = ENV['POSTMAN_API_KEY']
  config.api_secret = ENV['POSTMAN_API_SECRET']
  config.api_endpoint = ENV['POSTMAN_API_ENDPOINT']
end
```

This will add the following routes:

```
Routes for PostmanMta::Engine:
           messages POST   /messages(.:format)                                  postman_mta/messages#create
            message GET    /messages/:id(.:format)                              postman_mta/messages#show
conversation_labels POST   /conversations/:conversation_id/labels(.:format)     postman_mta/labels#create
 conversation_label DELETE /conversations/:conversation_id/labels/:id(.:format) postman_mta/labels#destroy
  conversation_tags POST   /conversations/:conversation_id/tags(.:format)       postman_mta/tags#create
   conversation_tag DELETE /conversations/:conversation_id/tags/:id(.:format)   postman_mta/tags#destroy
      conversations GET    /conversations(.:format)                             postman_mta/conversations#index
       conversation GET    /conversations/:id(.:format)                         postman_mta/conversations#show
```

for `messages#create` the following parameters accepted:

```ruby
    attribute :from, String
    attribute :to, Array # The array of recepient email addresses
    attribute :plain_body, String
    attribute :html_body, String
    attribute :bcc, Array # The array of bcc email addresses
    attribute :cc, Array # The array of cc email addresses
    attribute :reply_to, String
    attribute :in_reply_to, String
    attribute :subject, String
    attribute :attachments, Array # [{ base64: "YXNmYXNmYXNm\n", name: 'file.txt', content_type: 'text/plain' }]
```

Messages are grouped in conversations. Conversations can be accessed using corresponding `#index` and `#show` actions.

Filter parameters for `conversations#index`:

```ruby
    { tag_title: 'some_tag', tag_value: 'some_value' }
    { label: 'some_label_title' }
```

Conversations can be tagged and/or labeled. Labels and tags can be used for search. To create new tag for conversation, send the following params to `tags#create`:

```ruby
    attribute :title, String
    attribute :value, String
    attribute :conversation_id, Integer
```

Params for label:

```ruby
    attribute :title, String
    attribute :sort_order, Integer
    attribute :color, String
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/psyipm/postman_mta.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

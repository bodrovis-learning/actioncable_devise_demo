# ActionCable with Devise demo

## Main files worth checking

* cable.js (has to be included in application.js)
* channels/global_chat.coffee
* **all** files inside channels directory (*connection.rb* is used to check whether a user is logged in or not)
* message_broadcast_job.rb
* message.rb
* user.rb
* controllers
* views. Especially don't forget to add `action_cable_meta_tag` into your layout
* Gemfile. `gem 'redis'` should be added

### For Heroku

* [Procfile](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/Procfile) (config/puma.rb file has to be present).
Read more about Heroku and Puma [here](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server).
* [production.rb](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/config/environments/production.rb#L89).
`config.action_cable.allowed_request_origins` and `config.action_cable.url` HAS TO BE SET, otherwise users
won't be able to connect to socket. Don't forget to change URLs appropriately
* [cable.yml](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/config/cable.yml#L4)
has to be configured with a proper URL. For this demo [rediscloud](https://elements.heroku.com/addons/rediscloud) is used.
It stores URL to the redis server inside the `ENV["REDISCLOUD_URL"]` variable.

## Copyright

(c) 2016 [Ilya Bodrov](http://ilyabodrov.me)

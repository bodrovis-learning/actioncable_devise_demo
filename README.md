# ActionCable with Devise demo

## Main files worth checking

* [cable.js](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/assets/javascripts/cable.js) (has to be included in application.js). This file contains basic code for ActionCable to work correctly.
* [channels/global_chat.coffee](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/assets/javascripts/channels/global_chat.coffee).
This is the main file with all JS code to work with ActionCable and also to hide/show the chat window itself.
* [global_chat.scss](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/assets/stylesheets/global_chat.scss).
This contains all the styles for the chat window. Design sucks, so modify those as necessary (for example,
by tweaking colors, height of the window, padding etc).
* **all** files inside [channels directory](https://github.com/bodrovis-learning/actioncable_devise_demo/tree/master/app/channels) (*connection.rb* is used to check whether a user is logged in or not)
* [message_broadcast_job.rb](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/jobs/message_broadcast_job.rb)
* message.rb and user.rb models. Obviously, these files can vary from app to app, but the main point here is that one user may have many messages - that is, one to many relations.
Another VERY IMPORTANT piece of code is [this callback](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/models/message.rb#L6).
* controllers may vary. Note presence of [these two callbacks](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/controllers/application_controller.rb#L6) however.
Also note the presence of [MessagesController](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/controllers/messages_controller.rb). It may be empty, but has to be present in order to render
[messages from ActiveJob](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/jobs/message_broadcast_job.rb#L11). If you already have such controller, rename it but also don't forget to rename
the corresponding view folder and all references to this controller.
* views. Especially don't forget to add `action_cable_meta_tag` into [your layout](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/views/layouts/application.html.erb#L6). Don't forget
that the markup for the global chat itself is packed inside the [partial](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/views/shared/_global_chat.html.erb).
The actual message to render is located in its [own partial](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/views/messages/_message.html.erb) as well.
* Gemfile. `gem 'redis'` [should be added](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/Gemfile#L7)

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

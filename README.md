# ActionCable with Devise demo

[Demo](https://bodrovis-cable.herokuapp.com)

This demo shows how to build a chat app supporting multiple chat rooms and basic authorization. Only
authenticated users may access the app and only authorized ones may enter chat room (members of the room).
Powered by ActionCable, Devise, Redis, Formtastic

## Setup

There are 4 models:

* User
* ChatRoom
* RoomUser
* Message

User can be an owner of a chat room - in this case he is able to assign members to it. Members,
in turn, are permitted to enter chat room and post messages. Other users cannot enter chat rooms or listen
to socket.

RoomUser is an intermediate model to establish many-to-many relation between users and chat rooms.
RoomUsersController is used to add or remove members of a chat room; only owner may do this.

## Main files worth checking

* [cable.js](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/assets/javascripts/cable.js) (has to be included in application.js). This file contains basic code for ActionCable to work correctly.
* [channels/rooms.coffee](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/assets/javascripts/channels/rooms.coffee).
This is the main file with all JS code to work with ActionCable.
* **all** files inside [channels directory](https://github.com/bodrovis-learning/actioncable_devise_demo/tree/master/app/channels) (*connection.rb* is used to check whether a user is logged in or not)
* [message_broadcast_job.rb](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/jobs/message_broadcast_job.rb)
* message.rb and user.rb models. Obviously, these files can vary from app to app, but the main point here is that one user may have many messages - that is, one to many relations.
Another VERY IMPORTANT piece of code is [this callback](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/models/message.rb#L6).
* chat_room.rb and room_user.rb models.
* controllers may vary. Note presence of [the callback](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/controllers/application_controller.rb#L6) however.
Also note the presence of [MessagesController](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/controllers/messages_controller.rb). It may be empty, but has to be present in order to render
[messages from ActiveJob](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/jobs/message_broadcast_job.rb#L11). If you already have such controller, rename it but also don't forget to rename
the corresponding view folder and all references to this controller.
* RoomUsersController is required to manage members of a room.
* views. Especially don't forget to add `action_cable_meta_tag` into [your layout](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/views/layouts/application.html.erb#L6).
The actual message to render is located in its [own partial](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/views/messages/_message.html.erb) as well.
* Gemfile. `gem 'redis'` [should be added](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/Gemfile#L7).
Also `gem 'formtastic'` is used to easily build forms.
* [show.html.erb for chat rooms](https://github.com/bodrovis-learning/actioncable_devise_demo/blob/master/app/views/chat_rooms/show.html.erb) - the main view where messages are listed and the form is located.
The room's id is stored as a `data-` attribute. It is then passed as a parameter when establishing a connection inside the script.

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

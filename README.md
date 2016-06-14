# ActionCable with Devise demo

Main files worth checking:

* cable.js (has to be included in application.js)
* channels/global_chat.coffee
* **all** files inside channels directory (*connection.rb* is used to check whether a user is logged in or not)
* message_broadcast_job.rb
* message.rb
* user.rb
* controllers
* views. Especially don't forget to add `action_cable_meta_tag` into your layout
* Gemfile. `gem 'redis'` should be added

(c) 2016 [Ilya Bodrov](http://ilyabodrov.me)

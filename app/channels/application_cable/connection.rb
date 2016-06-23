# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    identified_by :current_admin

    def connect
      self.current_user = find_verified_user
      self.current_admin = find_verified_admin
      #logger.add_tags 'ActionCable', current_user.email
      #logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      verified_user =  env['warden'].user(:user) # this is looking strange, but the `user` is warden's method and `:user` is a scope's name
      if verified_user
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def find_verified_admin
      env['warden'].user(:admin)
    end
  end
end

class Message < ApplicationRecord
  belongs_to :user, optional: true

  # This callback fires after the message was created and the actual commit was done
  # We then simply queue the task to broadcast the new message to all subscribed clients
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end

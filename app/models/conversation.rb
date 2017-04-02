class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :memberships
  has_many :memberships

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
	 	user_firstnames = users.map(&:first_name).sort
	 	title = "#{user_firstnames.join(", ")}" #TODO - brittle, fix it!

	 	if conversation = Conversation.direct_messages.where(title: title).first
	 		conversation
	 	else
	 		# create a new conversation
	 		conversation = Conversation.new(title: title, direct_message: true)
	 		conversation.users = users
	 		conversation.save
	 		conversation
	 	end
	 end

	 def all_members(conversation)
		 conversation.users = users
	 end

	 def member?(user)
		 user.conversations.include?(self)
	 end

	 def is_direct_message?
	 	return self.direct_message
	 end
end

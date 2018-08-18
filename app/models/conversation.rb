class Conversation < ApplicationRecord
	belongs_to :sender, foreign_key: :sender_id, class_name: "User"
	belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

	has_many :messages

	validates_uniqueness_of :sender_id, scope: :recipient_id

	#it checks whether a convo exists between the two ids...we only want two users to have convo..
	#its just like private chat box

	  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end


end

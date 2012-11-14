class Message
	include ActiveModel::Validations

	attr_accessor :text
	attr_accessor :from_user

	validates_presence_of :text
	# validates_presence_of :from_user
end
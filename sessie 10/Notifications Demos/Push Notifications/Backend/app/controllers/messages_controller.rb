class MessagesController < ApplicationController

	def create
		message = Message.new
		message.text = params[:text] unless params[:text].nil?
		message.from_user = params[:from_user] unless params[:from_user].nil?
		render :json => { :error => "Woops" }, :status => 500 and return unless message.valid?

		notifications = Array.new

		devices = Device.all
		devices.reject! { |d| d.uuid == params[:uuid] } unless params[:uuid].nil?
		devices.each do |device|
			text = ""
			text << "#{message.from_user} zegt: " unless message.from_user.nil?
			text << message.text
			notifications << APNS::Notification.new(device.token, :alert => text, :sound => 'default')
		end

        APNS.send_notifications(notifications)
        
		render :json => { :success => true }
	end

end

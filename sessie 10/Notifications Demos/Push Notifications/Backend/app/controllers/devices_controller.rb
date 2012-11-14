class DevicesController < ApplicationController
	def create
		render :nothing => true, :status => 500 and return if params[:uuid].nil? || params[:token].nil?

		device = Device.find_or_create_by_uuid(params[:uuid])
		device.token = params[:token]
		device.save

		render :nothing => true
	end
end

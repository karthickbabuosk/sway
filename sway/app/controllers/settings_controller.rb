class SettingsController < ApplicationController

	before_filter :require_user
	
	def index
	end

	def create
		settings = Setting.new(:user_id => current_user.id, :api_key=> params[:api_key], :site => params[:site])
		settings.save!
	end
end

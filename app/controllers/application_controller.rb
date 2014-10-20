class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :nummess

  	def after_sign_in_path_for(resource)
		if current_user.profile
	 		profile_path(current_user.profile)
	 	else
	 		new_profile_path
	 	end
	end

	def nummess
		if user_signed_in?
			@nummess = Message.where("receiver_id = ? AND read = ?", current_user, false).count
		end
	end

end

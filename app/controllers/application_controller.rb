class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :nummess
  before_action :restrict_users, only: [:index, :show] #stop users from going to index or show pages until they meet criteria

  	def restrict_users
  		if user_signed_in?
  			if current_user.has_role? :client
  				if current_user.profile.agreed == nil
  					redirect_to edit_profile_path(current_user.profile)
  				end
  			end

  		end

  	end

  	def after_sign_in_path_for(resource)
  		# if the user has a profile
		if current_user.profile
			# check if the user has a trainer and has agreed to their engagement agreement
			if current_user.has_trainer? && current_user.profile.agreed?
				# go to the list of their programmes
	 			programmes_path(current_user.profile)
	 		elsif current_user.has_role? :client
	 			# edit their profile if they're a client, so that they can agree to the engagement agreement
	 			edit_profile_path(current_user.profile)
	 		else
	 			# view their clients if they're a trainer
	 			profiles_path
	 		end
	 	else
	 		# if they don't have a profile, get them to set up a new profile
	 		new_profile_path
	 	end
	end

	def nummess
		if user_signed_in?
			@nummess = Message.where("receiver_id = ? AND read = ?", current_user, false).count
		end
	end

end

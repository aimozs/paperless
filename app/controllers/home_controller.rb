class HomeController < ApplicationController
	skip_before_action :authenticate_user!
  def index

    @programmes = Programme.where('client = ?', current_user)
    @programme = Programme.where('client = ? AND programme_status = ?', current_user, 'assigned').first

    @users = User.all
    if user_signed_in?
    	if current_user.has_role? :trainer
    		redirect_to profiles_path
    	elsif current_user.has_role? :client
    		redirect_to programmes_path
    	end
    end
    
  end

  def review
  end
end

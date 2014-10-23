class HomeController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	    @programmes = Programme.where('client = ?', current_user)
  	    @programme = Programme.where('client = ? AND programme_status = ?', current_user, 'assigned').first
    @users = User.all
  end

  def review
  end
end

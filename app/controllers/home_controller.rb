class HomeController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@programmes = Programme.all
    @users = User.all

  end

  def review
  end
end

class RelationshipsController < ApplicationController

  def index
    @relationships = Relationship.all
  end

  def create
    @client = User.find(params[:relationship][:client_id])
    current_user.enroll!(@client)
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
end
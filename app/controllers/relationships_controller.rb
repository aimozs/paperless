class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:destroy]

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

  def destroy
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to relationships_path, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end
  
end
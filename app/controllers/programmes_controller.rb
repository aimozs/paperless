class ProgrammesController < ApplicationController
  before_action :set_programme, only: [:change_status, :show, :edit, :update, :destroy]

  # GET /programmes
  # GET /programmes.json
  def index
    @programmes = Programme.all
    @users = User.all

  end

  # GET /programmes/1
  # GET /programmes/1.json
  def show
    @exercises = @programme.exercises
    if params[:search]
      @search = Exercise.search do
        fulltext params[:search]
      end
      @exSearch = @search.results
    else
    @exSearch = Exercise.all
   end
  end

  def change_status
    # @new_state = params[:programme_status]
    # @programme.user = params[:client]
    if @programme.programme_status == 'draft'
      @programme.update_attribute('programme_status', 'assigned')
      DeliveryNotificationMailer.notify(@programme).deliver
      redirect_to :programmes
    else
      @programme.update_attribute('programme_status', 'completed')
      redirect_to :review
    end
  end

  def review
  end

  # GET /programmes/new
  def new
    if params[:client_id]
      @client = User.find_by(id: params[:client_id])
    end
    @programme = Programme.new
    @exercises = Exercise.all
    @users = User.all
  end

  # GET /programmes/1/edit
  def edit
  end

  # POST /programmes
  # POST /programmes.json
  def create
    @programme = Programme.new(programme_params)
    @programme.user = current_user
    @programme.programme_status = 'draft'


    respond_to do |format|
      if @programme.save
        format.html { redirect_to new_spec_path(programme: @programme.id), notice: 'Programme was successfully created.' }
        format.json { render :show, status: :created, location: @programme }
      else
        format.html { render :new }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programmes/1
  # PATCH/PUT /programmes/1.json
  def update
    respond_to do |format|
      if @programme.update(programme_params)
        format.html { redirect_to @programme, notice: 'Programme was successfully updated.' }
        format.json { render :show, status: :ok, location: @programme }
      else
        format.html { render :edit }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programmes/1
  # DELETE /programmes/1.json
  def destroy
    @programme.destroy
    respond_to do |format|
      format.html { redirect_to programmes_url, notice: 'Programme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme
      @programme = Programme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programme_params
      params.require(:programme).permit(:description, :due_date, :user_id, :client, :programme_status, specs_attributes:[:programme_id, :exercise_id, :weight, :time, :serie, :rep, :tempo, :_destroy])
    end
end

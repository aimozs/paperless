class ProfilesController < ApplicationController
  before_action :set_profile, only: [:downgrade, :promote, :show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    @client = Client.new
    @pending = Client.where(trainer: current_user.id)
    @rel = Relationship.where(trainer: current_user)
    @message = Message.last
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @rel = Relationship.where('client_id = ?', current_user)
    if current_user.has_role? :trainer
      @questions = Question.where(user: current_user)
    elsif current_user.has_role? :client
      @questions = Question.where(user: current_user.my_trainer)
    end
    @meal_days = MealDay.where(user: @profile.user)
    @days_of_the_week = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
    @meal_journals = MealJournal.where(user: @profile.user)
  end

  def get_answer(question)
    @answer.where(question: question)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  def promote
    @profile.user.add_role :trainer
    @profile.user.remove_role :client
    redirect_to :back
  end

  def downgrade
    @profile.user.add_role :client
    @profile.user.remove_role :trainer
    redirect_to :back
  end


  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
    if @profile.save
        if Client.find_by(email: current_user.email) # if the client is in the list of enrollment invitations
            @client = Client.find_by(email: current_user.email) # find them in the list
            current_user.reverse_relationships.create(trainer_id: @client.trainer) # create a relationship between them and the corresponding trainer ID
            @client.destroy # destroy the record from the list of invites, because their invitation process is complete
        end
        if current_user.has_role? :client # if they're a client go to their answers
          format.html { redirect_to answers_path, notice: 'Profile was successfully created.' }
        else
            # if they're a trainer go to make induction questions
          format.html { redirect_to questions_path, notice: 'Profile was successfully created.' }
        end
          format.json { render :show, status: :created, location: @profile }
        else
          format.html { render :new }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
      @questions = Question.where(user: current_user)
      @answers = Answer.where(user: @profile.user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :dob, :height, :weight, :social, :agreed, :engagement, :bodyfat, :injuries, :gender)
    end
end

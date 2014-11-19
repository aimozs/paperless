class MealDaysController < ApplicationController
  before_action :set_meal_day, only: [:show, :edit, :update, :destroy]

  respond_to :xml, :json, :html
  
  def index
    @meal_days = MealDay.where(user_id: current_user.id)
    @meal_journals = MealJournal.where(user_id: current_user.id)
    respond_with(@meal_days)
  end

  def show
    respond_with(@meal_day)
  end

  def new
    @meal_day = MealDay.new
    @days_of_the_week = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
    respond_with(@meal_day)
  end

  def edit
  end

  def create
    @meal_day = MealDay.new(meal_day_params)
    @meal_day.user_id = params[:client]
    @meal_day.day = params[:day]
    @profile = Profile.where(user_id: @meal_day.user_id).first.id
    @meal_day.save
    respond_with(@meal_day, location: profile_path(@profile))
  end

  def update
    @meal_day.update(meal_day_params)
    @profile = @meal_day.user.profile
    respond_with(@meal_day, location: profile_path(@profile))
  end

  def destroy
    @meal_day.destroy
    respond_with(@meal_day)
  end

  private
    def set_meal_day
      @meal_day = MealDay.find(params[:id])
    end

    def meal_day_params
      params.require(:meal_day).permit(:day, :date, :breakfast, :lunch, :dinner, :snack, :meal_plan_id, :client)
    end
end

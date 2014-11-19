class MealJournalsController < ApplicationController
  before_action :set_meal_journal, only: [:show, :edit, :update, :destroy]

  respond_to :xml, :json, :html

  def index
    @meal_journals = MealJournal.all
    respond_with(@meal_journals)
  end

  def show
    respond_with(@meal_journal)
  end

  def new
    @meal_journal = MealJournal.new
    respond_with(@meal_journal)
  end

  def edit
  end

  def create
    @meal_journal = MealJournal.new(meal_journal_params)
    @meal_journal.user = current_user
    @meal_journal.day = @meal_journal.date.strftime("%A")
    @meal_journal.save
    respond_with(@meal_journal, location: meal_days_path)
  end

  def update
    @meal_journal.update(meal_journal_params)
    @meal_journal.user = current_user
    @meal_journal.day = @meal_journal.date.strftime("%A")
    respond_with(@meal_journal, location: meal_days_path)
  end

  def destroy
    @meal_journal.destroy
    respond_with(@meal_journal, location: meal_days_path)
  end

  private
    def set_meal_journal
      @meal_journal = MealJournal.find(params[:id])
    end

    def meal_journal_params
      params.require(:meal_journal).permit(:meal_day_id, :date, :meal, :ate, :user_id)
    end
end

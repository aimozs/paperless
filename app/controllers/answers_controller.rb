class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  respond_to :xml, :json, :html
  def index
    @answers = Answer.all.where(user: current_user)
    @questions = Question.all.where(user: current_user.my_trainer)
    respond_with(@answers)
  end

  def show
    respond_with(@answer)
  end

  def new
    @answer = Answer.new
    respond_with(@answer)
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    # @answer.question = params[:question] --something like this to set the relationship between the answer and it's question
    @answer.save
    respond_with(@answer, :location => profile_path(current_user.profile))
  end

  def update
    @answer.update(answer_params)
    respond_with(@answer, :location => profile_path(current_user.profile))
  end

  def destroy
    @answer.destroy
    respond_with(@answer)
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :content)
    end
end

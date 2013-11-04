class AnswersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Answer saved"
      redirect_to answers_path
    else
      render 'new'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if @answer.delete
      flash[:success] = "Answer deleted"
    else
      flash[:error] = "Answer couldn't be deleted"
    end
    redirect_to answers_path
  end

  def index
    @answers = Answer.all
  end

  private
    def answer_params
      params.require(:answer).permit(:question, :answer)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end

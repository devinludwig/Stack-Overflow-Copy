class QuestionsController < ApplicationController

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if params[:vote] == "up"
      @question.rating+=1
    elsif params[:vote] == "down"
      @question.rating -=1
    end
    @question.update(rating: @question.rating)
    redirect_to user_question_path(@question.user, @question)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

private
  def question_params
    params.require(:question).permit(:content)
  end
end

class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to user_question_path(@question.user, @question)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if params[:vote] == "up"
      @answer.rating+=1
    elsif params[:vote] == "down"
      @answer.rating -=1
    end
    @answer.update(rating: @answer.rating)
    redirect_to user_question_path(@answer.question.user, @answer.question)
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

private
  def answer_params
    params.require(:answer).permit(:content)
  end
end

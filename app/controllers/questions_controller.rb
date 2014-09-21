class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(id: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      flash[:notice]= "Fill out better"
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update(question_params)
        flash[:notice] = "updated question"
        redirect_to question_path(@question)
      else
        render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    flash[:notice] = "Question removed"
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end

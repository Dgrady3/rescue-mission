class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.save
        redirect_to question_path(@question), notice: 'Answer created.'
    end

    private

    def answer_params
      params.require(:answer).permit(:description)
  end
end

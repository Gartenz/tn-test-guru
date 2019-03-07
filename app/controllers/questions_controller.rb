class QuestionsController < ApplicationController
  before_action :search_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    render json: { question: Question.find(params[:id]) }
  end

  def new

  end

  def create
    result = Question.create(question_params)
    redirect_to test_questions_path
  end

  def destroy
    Question.delete(params[:id])
  end

  private

  def search_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_record_not_found
    render plain: "Record not found!"
  end

end

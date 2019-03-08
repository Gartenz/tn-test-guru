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
    question = @test.questions.new(question_params)
    if qeustion.save
      redirect_to test_questions_path
    else
      handle error
    end
  end

  def destroy
    question = Qustion.find(params[:id]).destroy

    render plain: "Question deleted"
  end

  private

  def search_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_record_not_found
    head :not_found
    render plain: "Record not found!"
  end

end

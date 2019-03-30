class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :check_timer, only: :update

  def show

  end

  def result
    @percentage = @test_passage.test_result
  end

  def update

    answer_ids = params[:answer_ids]
    if answer_ids
      @test_passage.accept!(answer_ids)
      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      flash[:warning] = "You need to choose answer"
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    web_gist = client.call

    if client.last_response.status == 201
      db_gist = Gist.new(gist_id: web_gist.id, user: current_user, question: @test_passage.current_question, url: web_gist[:html_url])
      if db_gist.save
        flash[:primary] = web_gist[:html_url]
      else
        flash[:danger] = "There was error while saving gist to DB"
      end
    else
      flash[:danger] = "There was an error while creating Gist on GitHub"
    end
    redirect_to @test_passage

  end

  private

  def check_timer
    redirect_to result_test_passage_path(@test_passage) if times_up?
  end

  def times_up?
    test_end = @test_passage.created_at.to_i + @test_passage.test.test_minutes * 60
    time_now = DateTime.now.to_i
    test_end - time_now <= 0
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

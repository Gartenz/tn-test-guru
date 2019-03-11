module QuestionsHelper
  def question_header(question)
    "Create New #{question.test.title} Question" if question.new_record?
    "Edit #{question.body} Question" if question.persisted?
  end
end

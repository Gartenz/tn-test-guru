module QuestionsHelper
  METHODS = {new: 'Create New', edit: 'Edit'}.freeze

  def question_header(method, title)
    "#{METHODS[method]} #{title} Question"
  end
end

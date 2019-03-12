class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  private

  def before_validation_set_first_question
    current_question = test.questions.first if test.persisted?
  end
end

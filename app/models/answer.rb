class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validates_question_size, on: :create

  scope :correct, -> { where(correct: true) }
  
  private

  def validates_question_size
    errors.add(:answers, "question count is in range 1..4") if question.answers.size >= 4
  end
end

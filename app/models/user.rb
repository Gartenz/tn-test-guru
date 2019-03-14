require 'digest/sha1'

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', inverse_of: :author
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def completed_tests(level)
    tests.where(level: level)
  end
end

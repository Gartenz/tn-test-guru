class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', inverse_of: :author
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :name, presence: true
  validates :email, presence: true
  
  def completed_tests(level)
    tests.where(level: level)
  end
end

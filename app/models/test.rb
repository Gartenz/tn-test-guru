class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests(category_name)
    tests = Test.joins(:category).where('categories.title = ?', category_name)
                .order(title: :desc).pluck('tests.title')
  end
end

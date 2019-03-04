class Test < ApplicationRecord
  belongs_to :category

  def self.tests(category_name)
    tests = Test.select(:title).joins(:category).where('categories.title = ?', category_name).order(title: :desc)
    tests.map { |test| test.title }
  end
end

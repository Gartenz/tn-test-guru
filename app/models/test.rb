class Test < ApplicationRecord
  belongs_to :category

  def self.tests(category_name)
    tests = Test.joins(:category).where('categories.title = ?', category_name)
                .order(title: :desc).pluck('tests.title')
  end
end

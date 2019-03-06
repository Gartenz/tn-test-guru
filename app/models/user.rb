class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', inverse_of: :author
  has_many :tests_users
  has_many :tests, through: :tests_users
  
  def completed_tests(level)
    # Test.joins('INNER JOIN test_histories ON tests.id = test_histories.test_id')
    #     .where("test_histories.user_id = ? AND tests.level = ?", self.id, level)
    self.tests.where(level: level)
  end
end

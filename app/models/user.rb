class User < ApplicationRecord
  has_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  
  def tests(level)
    Test.joins('INNER JOIN test_histories ON tests.id = test_histories.test_id')
        .where("test_histories.user_id = ? AND tests.level = ?", self.id, level)
  end
end

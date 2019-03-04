class User < ApplicationRecord
  def tests(level)
    Test.joins('INNER JOIN test_histories ON tests.id = test_histories.test_id')
        .where("test_histories.user_id = ?", self.id).find_by(level: level)
  end
end

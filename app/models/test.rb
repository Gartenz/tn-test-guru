class Test < ApplicationRecord
  belongs_to :category

  def tests(level)
    TestHistory.find_by(user_id: self.id)
  end
end

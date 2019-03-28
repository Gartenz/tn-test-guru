class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test

  end

  def check_badges
    badges = Badge.pluck(:id, :rule)
    acquired_badges = []
    badges.each do |id, rule|
      acquired_badges << id if self.call "#{rule}_badge".to_sym
    end
  end

  private

  def first_test_badge
    @user.tests.count == 1
  end

  def one_category_completed_badge
    categories = Category.pluck(:title)
    categories.each do |category|
      user.tests.by_category(category) == Test.by_category(category)
    end
  end

end

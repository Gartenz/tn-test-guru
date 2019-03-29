class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test

  end

  def check_badges(badges)
    acquired_badges = []
    badges.each do |badge|
      acquired_badges << id if self.call "#{badge.badge_rule.name}?".to_sym value
    end
  end

  private

  # Badge cheks for passage tests

  def firt_test?(value)
    @user.tests.count == 0
  end

  def category_completion?(value)

  end

  def first_failure?(value)
  end

  def first_speedrun?(value)
  end

  #Badge checks for admin

  def first_test_creation? (value)
    @user.created_tests == 0
  end

  def x_tests_creation (value)
    @user.created_tests.count == value
  end

end

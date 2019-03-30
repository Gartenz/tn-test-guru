class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @result = test_passage
  end

  def award_badges(badges)
    acquired_badges = badges.map { |badge| if self.send "#{badge.badge_rule.name}?".to_sym, badge.rule_value }
    Badge.where(id: acquired_badges)
  end

  private

  # Badge cheks for passage tests

  def firt_test?(_value)
    @user.tests.count == 0
  end

  def category_completion?(value)
    test_ids = @user.tests.pluck(:id).uniq
    test_ids.count == Test.by_category(value).published.count
  end

  def first_failure?(_value)
    !@result.success?
  end

  def first_speedrun?(value)
    time_start = @result.created_at.to_i
    time_end = @result.time_completion.to_i
    time_end - time_start == value * 60
  end

  #Badge checks for admin

  def first_test_creation? (_value)
    @user.created_tests == 0
  end

  def x_tests_creation (value)
    @user.created_tests.count == value
  end

end

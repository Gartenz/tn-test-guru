class BadgesController < ApplicationController
  def user_badges
    @badges = current_user.badges
  end

  def all_badges
    @badges = Badge.all
  end
end

class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  has_one_attached :image
  belongs_to :badge_rule

  scope :passage_badges, -> { joins(:badge_rule).where('badge_rules.rule_type = ?', 'Passage') }
  scope :creation_badges, -> { joins(:badge_rule).where('badge_rules.rule_type = ?', 'Creation') }
end

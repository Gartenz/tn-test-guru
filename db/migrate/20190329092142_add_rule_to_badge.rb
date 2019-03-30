class AddRuleToBadge < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :badge_rule, foreign_key: true
    add_column :badges, :rule_value, :string, default: nil
    add_column :badges, :single, :boolean
  end
end

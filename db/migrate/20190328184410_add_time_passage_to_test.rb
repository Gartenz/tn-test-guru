class AddTimePassageToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :test_minutes, :integer
  end
end

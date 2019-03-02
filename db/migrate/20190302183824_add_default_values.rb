class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :right, false)
  end
end

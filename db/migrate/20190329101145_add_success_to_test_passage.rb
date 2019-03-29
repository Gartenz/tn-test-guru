class AddSuccessToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :success, :boolean, default: false
    add_column :test_passages, :time_completion, :datetime
  end
end

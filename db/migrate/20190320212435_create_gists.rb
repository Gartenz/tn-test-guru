class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :question
      t.string :gist_id, unique: true
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

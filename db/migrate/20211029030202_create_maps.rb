class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.text :content, null: false
      t.references :user, :affirmation, foreign_key: true
      t.timestamps
    end
  end
end

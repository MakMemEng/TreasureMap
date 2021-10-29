class CreateAffirmations < ActiveRecord::Migration[6.1]
  def change
    create_table :affirmations do |t|
      t.string :title
      t.text :body
      t.string :image_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

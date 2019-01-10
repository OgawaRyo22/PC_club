class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.string :date
      t.string :link
      t.string :creator
      t.timestamps null: false
    end
  end
end

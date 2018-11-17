class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    t.string :title
    t.string :content
    t.date :date
    t.timestamps null: false
    end
  end
end

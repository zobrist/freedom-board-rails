class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user
      t.text :message
      t.string :time

      t.timestamps null: false
    end
  end
end

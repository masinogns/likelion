class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :like
      t.references :user, index: true

      t.timestamps
    end
  end
end

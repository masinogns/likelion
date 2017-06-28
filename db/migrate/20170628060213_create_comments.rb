class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      # t.belongs_to :post
      t.integer :post_id
      t.string :content1
      t.string :content2
      t.string :content3
      t.integer :count
      t.references :user, index: true

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      # t.belongs_to :post
      t.integer :post_id
      t.string :content

      t.timestamps
    end
  end
end

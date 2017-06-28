class AddParentCommentToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :pid, :integer
  end
end

class RenameCommentsFieldInBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :comments, :comment
  end
end

class RenameLikeToLikes < ActiveRecord::Migration
  def change
    rename_column :multas, :like, :likes
  end
end

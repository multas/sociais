class AddLikeToMulta < ActiveRecord::Migration
  def change
    add_column :multas, :like, :integer, :null => false, :default => 0
  end
end

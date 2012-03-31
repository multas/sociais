class RemoveFotoFromMulta < ActiveRecord::Migration
  def up
    remove_column :multas, :foto
  end

  def down
    add_column :multas, :foto, :string
  end
end

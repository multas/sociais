class AddHiddenToMulta < ActiveRecord::Migration
  def change
    add_column :multas, :hidden, :boolean, :null => false, :default => :false
  end
end

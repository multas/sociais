class AddLatLngToMulta < ActiveRecord::Migration
  def change
    add_column :multas, :lat, :float
    add_column :multas, :lng, :float
  end
end

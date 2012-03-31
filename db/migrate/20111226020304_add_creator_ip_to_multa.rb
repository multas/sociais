class AddCreatorIpToMulta < ActiveRecord::Migration
  def change
    add_column :multas, :creator_ip, :string
  end
end

class AddApiToMultas < ActiveRecord::Migration
  def change
    add_column :multas, :api_key_id, :integer
  end
end

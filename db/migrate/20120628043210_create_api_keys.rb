class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :api_id
      t.string :api_secret
      t.string :app_name
      t.string :app_site
      t.string :owner_name
      t.string :owner_email
      t.boolean :enabled
      t.boolean :excluded

      t.timestamps
    end
  end
end

class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :multa
      t.integer :motivo
      t.text :descricao

      t.timestamps
    end
    add_index :flags, :multa_id
  end
end

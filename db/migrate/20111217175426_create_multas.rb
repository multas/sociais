class CreateMultas < ActiveRecord::Migration
  def change
    create_table :multas do |t|
      t.text :descricao
      t.string :placa
      t.string :video
      t.string :foto
      t.timestamp :data_ocorrencia

      t.timestamps
    end
  end
end

class AddAttachmentFotoToMulta < ActiveRecord::Migration
  def self.up
    add_column :multas, :foto_file_name, :string
    add_column :multas, :foto_content_type, :string
    add_column :multas, :foto_file_size, :integer
    add_column :multas, :foto_updated_at, :datetime
  end

  def self.down
    remove_column :multas, :foto_file_name
    remove_column :multas, :foto_content_type
    remove_column :multas, :foto_file_size
    remove_column :multas, :foto_updated_at
  end
end

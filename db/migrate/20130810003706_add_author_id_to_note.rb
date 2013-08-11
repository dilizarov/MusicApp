class AddAuthorIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :author_id, :integer
    add_index :notes, :author_id
  end
end

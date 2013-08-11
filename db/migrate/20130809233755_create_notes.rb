class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.integer :track_id

      t.timestamps
    end

    add_index :notes, :track_id
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :session_token
      t.string :activation_token
      t.boolean :admin

      t.timestamps
    end
  end
end

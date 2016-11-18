class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email_address
      t.string :name_first
      t.string :name_last
      t.string :password_digest

      t.timestamps
    end
  end
end

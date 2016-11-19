class CreateBusiness < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.belongs_to :users, index: true
      t.string :name
      t.string :service
      t.text :feedback, array: true, default: []


      t.timestamps
    end
  end
end

class CreateBusiness < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :service
      t.integer :overall_score


      t.timestamps
    end
  end
end

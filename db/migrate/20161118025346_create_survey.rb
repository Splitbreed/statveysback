class CreateSurvey < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.belongs_to :business, index: true
      t.belongs_to :user, index: true
      t.string :satisfaction
      t.text :feedback
      t.integer :scores

      t.timestamps
    end
  end
end

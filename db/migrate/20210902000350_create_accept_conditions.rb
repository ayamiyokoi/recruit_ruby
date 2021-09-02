class CreateAcceptConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :accept_conditions do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.integer :importance, defalut: 0

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.integer :name, defalut: 0
      t.datetime :date
      t.integer :is_passed, defalut: 0

      t.timestamps
    end
  end
end

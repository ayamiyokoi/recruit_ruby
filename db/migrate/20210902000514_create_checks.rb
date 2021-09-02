class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.references :company, foreign_key: true
      t.references :accept_condition, foreign_key: true
      t.integer :accept

      t.timestamps
    end
  end
end

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :media
      t.string :job
      t.text :detail

      t.timestamps
    end
  end
end

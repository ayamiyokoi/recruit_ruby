class AddIsActiveToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :is_active, :boolean, defalut: false
  end
end

class AddIndexToCompanies < ActiveRecord::Migration[5.2]
  def change
    #add_column :companies, :nip, :string
    add_index :companies, :nip, unique: true
  end
end

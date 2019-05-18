class AddFamilyNameAndTypeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :family_name, :string
    add_column :companies, :type, :boolean
  end
end

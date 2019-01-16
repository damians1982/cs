class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :nip
      t.string :street
      t.string :postal_code

      t.timestamps
    end
  end
end

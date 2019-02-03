class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :regnum
      t.text :info

      t.timestamps
    end
  end
end

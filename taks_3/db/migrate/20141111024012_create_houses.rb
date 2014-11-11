class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :houseno
      t.string :tipe
      t.string :address

      t.timestamps
    end
  end
end

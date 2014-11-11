class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :noktp
      t.string :birthdate
      t.integer :houseid

      t.timestamps
    end
  end
end

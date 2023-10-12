class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birthdate
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

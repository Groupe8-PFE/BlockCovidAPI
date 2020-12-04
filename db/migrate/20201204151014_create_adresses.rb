class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :rue
      t.string :ville
      t.integer :code_postal

      t.timestamps
    end
  end
end

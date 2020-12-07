class CreateCitoyens < ActiveRecord::Migration[6.0]
  def change
    create_table :citoyens do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end

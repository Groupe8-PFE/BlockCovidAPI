class CreateMedecins < ActiveRecord::Migration[6.0]
  def change
    create_table :medecins do |t|
      t.string :prenom
      t.string :nom
      t.integer :inami
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end

class CreateEtablissements < ActiveRecord::Migration[6.0]
  def change
    create_table :etablissements do |t|
      t.string :nom_etablissement
      t.string :mot_de_passe

      t.timestamps
    end
  end
end

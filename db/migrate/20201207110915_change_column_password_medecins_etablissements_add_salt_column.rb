class ChangeColumnPasswordMedecinsEtablissementsAddSaltColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :medecins, :mot_de_passe, :mot_de_passe_hash
    rename_column :etablissements, :mot_de_passe, :mot_de_passe_hash
    add_column :medecins, :mot_de_passe_salt, :string
    add_column :etablissements, :mot_de_passe_salt, :string
  end
end

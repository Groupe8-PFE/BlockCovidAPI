class AjouterColonneMotDePasseAMedecinsEtablissement < ActiveRecord::Migration[6.0]
  def change
    add_column :medecins, :password_digest, :string
    add_column :etablissements, :password_digest, :string
  end
end

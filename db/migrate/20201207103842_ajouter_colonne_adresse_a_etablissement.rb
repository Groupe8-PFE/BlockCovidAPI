class AjouterColonneAdresseAEtablissement < ActiveRecord::Migration[6.0]
  def change
    add_reference :etablissements, :adresse, foreign_key: true
  end
end

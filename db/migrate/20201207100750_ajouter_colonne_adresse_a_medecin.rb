class AjouterColonneAdresseAMedecin < ActiveRecord::Migration[6.0]
  def change
    add_reference :medecins, :adresse, foreign_key: true
    #add_foreign_key :medecins, :adresse
  end
end

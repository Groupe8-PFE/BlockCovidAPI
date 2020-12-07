class AjouterColonneEtablissementALieu < ActiveRecord::Migration[6.0]
  def change
    add_reference :lieus, :etablissement, foreign_key: true
  end
end

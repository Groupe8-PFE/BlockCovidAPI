class AjouterColonneMotDePasseMedecins < ActiveRecord::Migration[6.0]
  def change
    add_column :medecins, :mot_de_passe, :string
  end
end

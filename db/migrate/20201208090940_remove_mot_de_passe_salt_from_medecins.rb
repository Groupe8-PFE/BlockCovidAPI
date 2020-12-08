class RemoveMotDePasseSaltFromMedecins < ActiveRecord::Migration[6.0]
  def change
    remove_column :medecins, :mot_de_passe_salt, :string
  end
end

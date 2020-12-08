class RemoveMotDePasseSaltFromEtablissements < ActiveRecord::Migration[6.0]
  def change
    remove_column :etablissements, :mot_de_passe_salt, :string
  end
end

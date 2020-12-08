class AjouterEmailTelephoneEtablissement < ActiveRecord::Migration[6.0]
  def change
    add_column :etablissements, :email, :string
    add_column :etablissements, :telephone, :string
  end
end

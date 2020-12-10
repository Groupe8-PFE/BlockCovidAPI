class AjouterColonneTokenDeviceToCitoyens < ActiveRecord::Migration[6.0]
  def change
    add_column :citoyens, :token_device, :string, null:false, unique:true
  end
end

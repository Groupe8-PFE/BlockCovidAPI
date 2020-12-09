class AjouterColonneDeviceIdToCitoyens < ActiveRecord::Migration[6.0]
  def change
    add_column :citoyens, :device_id, :string, null:false, unique:true
  end
end

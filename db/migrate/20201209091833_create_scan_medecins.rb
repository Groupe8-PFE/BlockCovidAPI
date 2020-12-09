class CreateScanMedecins < ActiveRecord::Migration[6.0]
  def change
    create_table :scan_medecins do |t|
      t.references :medecin, null: false, foreign_key: true
      t.references :citoyen, null: false, foreign_key: true

      t.timestamps
    end
  end
end

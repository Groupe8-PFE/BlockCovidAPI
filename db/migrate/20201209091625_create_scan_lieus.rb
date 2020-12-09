class CreateScanLieus < ActiveRecord::Migration[6.0]
  def change
    create_table :scan_lieus do |t|
      t.references :lieu, null: false, foreign_key: true
      t.references :citoyen, null: false, foreign_key: true

      t.timestamps
    end
  end
end

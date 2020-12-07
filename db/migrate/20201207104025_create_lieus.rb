class CreateLieus < ActiveRecord::Migration[6.0]
  def change
    create_table :lieus do |t|
      t.string :nom
      t.string :description

      t.timestamps
    end
  end
end

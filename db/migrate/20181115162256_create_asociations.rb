class CreateAsociations < ActiveRecord::Migration[5.2]
  def change
    create_table :asociations do |t|
      t.references :user, foreign_key: true
      t.references :expenses_sheet, foreign_key: true

      t.timestamps
    end
  end
end

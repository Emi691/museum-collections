class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.integer :treatment_id
      t.integer :piece_id
      t.text :description
      t.datetime :date_time

      t.timestamps
    end
  end
end

class CreateTreatments < ActiveRecord::Migration[6.1]
  def change
    create_table :treatments do |t|
      t.text :description
      t.boolean :completed
      t.datetime :date_time

      t.timestamps
    end
  end
end

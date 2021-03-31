class CreatePieces < ActiveRecord::Migration[6.1]
  def change
    create_table :pieces do |t|
      t.integer :user_id
      t.integer :museum_id
      t.string :title
      t.string :artist
      t.text :description
      t.string :medium
      t.string :dimensions
      t.integer :weight
      t.string :location
      t.text :provenance
      t.integer :appraised_value
      t.text :notes

      t.timestamps
    end
  end
end

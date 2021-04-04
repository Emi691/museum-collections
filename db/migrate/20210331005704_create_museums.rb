class CreateMuseums < ActiveRecord::Migration[6.1]
  def change
    create_table :museums do |t|
      t.string :name
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end

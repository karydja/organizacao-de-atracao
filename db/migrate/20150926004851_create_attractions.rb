class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.references :user
      t.string :name
      t.text :description
      t.integer :media
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end

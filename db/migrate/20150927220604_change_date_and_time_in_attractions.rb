class ChangeDateAndTimeInAttractions < ActiveRecord::Migration
  def change
    remove_column :attractions, :date
    remove_column :attractions, :time

    add_column :attractions, :date, :datetime
  end
end

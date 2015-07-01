class AddRegionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region, :text
  end
end

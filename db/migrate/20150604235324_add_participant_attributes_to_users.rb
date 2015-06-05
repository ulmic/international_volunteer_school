class AddParticipantAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school, :text
    add_column :users, :another_line, :text
    add_column :users, :organization, :text
    add_column :users, :what_you_want, :text
    add_column :users, :block, :text
  end
end

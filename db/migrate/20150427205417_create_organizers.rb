class CreateOrganizers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :patronymic, :text
    add_column :users, :last_name, :text
    add_column :users, :birth_date, :date
    add_column :users, :phone, :text
    add_column :users, :social_link, :text
    add_column :users, :municipality, :text
    add_column :users, :locality, :text
    add_column :users, :home_adress, :text
    add_column :users, :experience, :text
    add_column :users, :reason, :text
    add_column :users, :activity_line, :text
    add_column :users, :deals, :text
    add_column :users, :pluses, :text
    add_column :users, :minuses, :text
    add_column :users, :type, :text
    add_column :users, :accept_agreement, :boolean
    add_column :users, :state, :text
  end
end

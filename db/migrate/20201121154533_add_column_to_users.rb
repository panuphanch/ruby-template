class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_active, :boolean
    add_column :users, :role, :string

    User.where(:email => 'admin@ncc.com').update_all({:is_active => true, :role => 'admin'})
  end
end

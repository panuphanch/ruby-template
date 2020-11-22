class RemoveRolesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :superadmin_role, :boolean
    remove_column :users, :moderator_role, :boolean
    remove_column :users, :user_role, :boolean
  end
end

class AddSuperadmin < ActiveRecord::Migration[5.1]
  def change
    User.create! do |u|
      u.email     = 'admin@ncc.com'
      u.password  = 'password'
      u.superadmin_role = true
    end
  end
end

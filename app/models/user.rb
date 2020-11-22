class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ROLES = %w[admin moderator user].freeze
  attr_accessor :changing_password

  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end

  def change_password
    self.changing_password = true
    yield
    self.changing_password = false
  end

  def can_validate_password?
    self.new_record? || self.changing_password
  end
end

# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.role == "admin"
    if user.role == "moderator"
      # can :manage, User
    end

  end
  
end

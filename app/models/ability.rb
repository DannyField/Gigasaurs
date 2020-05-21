# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # alias_action :create, :read, :update, :destroy, to: :crud
    # user ||= User.new
  end
  # I'm having weird issues with Cancancan. I've put things in place that stop non owned user from changing and deleting posts though

  # can :read, Gig
  # can [:index, :show, :new, :create], Band
  # can [:edit, :update, :destroy], Band, user_id: user.id
  # can [:index, :show, :new, :create], Gig
  # can [:edit, :update, :destroy], Gig
  # can [:index, :show, :new, :create], User
  # can [:edit, :update, :destroy], User
  #   end
end

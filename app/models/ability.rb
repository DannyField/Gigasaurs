# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  #   user ||= User.new

  #   alias_action :create, :read, :update, :destroy, to: :crud
    
  #   #A guest
  # can :read, Gig

  # if !user
  #   user = User.new
  # end
  
  # # A user
  # if user.present?
  #   can [:index, :show], Gig
  #   can [:edit, :create, :update, :destroy], Gig, user_id: user_id
  #   can [:show], Band
  #   can [:edit, :create, :update, :destroy], Band, user: id
  #   can [:show, :edit, :create, :update, :destroy], User, user: id
  # end

  #   # Admin
  #   if user.admin
  #     can :manage, :all
  #     can :destroy, User
  #   end

  end
end

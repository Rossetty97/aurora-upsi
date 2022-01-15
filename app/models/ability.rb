class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new
    if user.role=="Admin"
        can :manage, :all
    else
        can :read, Service
        can :read, Ram
        can :create, Ram
        can :create, Booking
        can :read, Booking, user_id: user.id
        can :update, Booking, user_id: user.id
        can :destroy, Booking, user_id: user.id
    end
  end
end
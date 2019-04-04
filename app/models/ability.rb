
class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user && user.role == 2
    can :manage, Cart if user && user.role == 1
    can :manage, Order if user && user.role == 1
  end
end

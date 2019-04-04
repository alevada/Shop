
class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all  if user && user.role == 2   # admin
    can :manage, Cart  if user && user.role == 1   # any other user
    can :manage, Order if user && user.role == 1
  end
end


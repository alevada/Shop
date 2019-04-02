
class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user && user.role == 2
  end
end

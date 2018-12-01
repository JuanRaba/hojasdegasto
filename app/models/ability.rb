class Ability
  include CanCan::Ability

  def is_user_asociated(expensesSheet, user)
    expensesSheet.users.where(id: user.id).present?  
  end

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    can :create, ExpensesSheet # index show create
    can :read, ExpensesSheet do |expensesSheet|
      is_user_asociated(expensesSheet, user)
    end

    can :create, Expense do |expense|
      is_user_asociated( expense.expensesSheet, user )
    end
    can :claim, Expense do |expense|
      expense.user.nil? and is_user_asociated( expense.expensesSheet, user )
    end
    can :destroy, Expense do |expense|
      is_user_asociated( expense.expensesSheet, user )
    end

    can :create, Asociation do |asociation|
      asociation.expensesSheet.owner == user
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

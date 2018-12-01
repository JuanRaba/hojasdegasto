class Ability
  include CanCan::Ability

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
      expensesSheet.is_user_asociated(user)
    end
    can :destroy, ExpensesSheet do |expensesSheet|
      expensesSheet.owner == user
    end

    can :create, Expense do |expense|
      expense.expensesSheet.is_user_asociated(user)
    end
    can :claim, Expense do |expense|
      expense.user.nil? and expense.expensesSheet.is_user_asociated(user)
    end
    can :destroy, Expense do |expense|
      # add expensesSheet policy? so owner or asociated can delete expenses
      expense.expensesSheet.is_user_asociated(user)
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

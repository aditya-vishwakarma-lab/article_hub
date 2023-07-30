# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    case user
    when Reader
      can :read, Comment
      can :create, Comment unless user.blocked
      can :read, Article, published: true
    when Author
      can :list_articles_by_author, Article
      can [:read, :create], Comment
      can [:read, :create], Article
      can [:update, :destroy], Article, author: user
    when Admin
      can [:read, :create], Comment
      can [:read, :update], Reader
      can :read, Article, published: true
    end

    # return unless current_author  # additional permissions for logged in users (they can read their own posts)
    # can :read, Post, user: user

    # return unless current_admin  # additional permissions for administrators
    # can :manage, :all
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
      # can :manage, :all
    #
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end

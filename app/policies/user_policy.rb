class UserPolicy < ApplicationPolicy

  def index?
    false
  end

  def show?
    return user.present? && record == user
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

end
class ItemPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    index?
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

end
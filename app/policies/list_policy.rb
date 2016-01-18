class ListPolicy < ApplicationPolicy

  def index?
    return true
  end

  def show?
    return !record.private || record.user == user
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    return user.present? && record.user == user
  end

  def update?
    new?
  end

  def post_to_twitter?
    return user.present? && !record.private
  end

end
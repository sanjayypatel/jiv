class ListingPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    create?
  end

end
class PlaylistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user == user
  end

  def update?
    true
  end

  def search?
    true
  end

  def destroy?
    record.user == user
  end

  def create_spotify?
    record.user == user
  end

end

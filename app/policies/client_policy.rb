class ClientPolicy < ApplicationPolicy
	attr_reader :user, :client

  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? && !client.deleted
  end

  def create?
    user.admin?
  end

  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin? && !client.deleted
  end

  def destroy?
    user.admin? && !client.deleted
  end
end
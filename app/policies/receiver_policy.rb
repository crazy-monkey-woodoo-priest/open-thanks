class ReceiverPolicy
  attr_accessor :current_user, :resource

  def show?
    true
  end
  alias_method :index?, :show?

  def show_enable?
    current_user == resource.user
  end

  def new?
    !!current_user
  end
  alias_method :create?, :new?

  def edit?
    current_user == resource.user
  end
  alias_method :update?, :edit?

  def destroy?
    current_user == resource.user
  end

  def can_appriciate?
    current_user && current_user != resource.user
  end
end

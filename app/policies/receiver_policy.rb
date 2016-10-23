class ReceiverPolicy
  attr_accessor :current_user, :resource

  def show?
    true
  end

  def can_see_latest?
    true
  end

  def index?
    !!current_user
  end

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
    current_user \
      && current_user != resource.user \
      && !resource.appriciated?(by: current_user)
  end
end

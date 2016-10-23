class ReceiverPolicy
  attr_accessor :resource

  def show?(by:)
    true
  end

  def self.can_see_latest?(by:)
    true
  end

  def self.index?(by:)
    !!by
  end

  def show_enable?(by:)
    by == resource.user
  end

  def new?(by:)
    !!by
  end
  alias_method :create?, :new?

  def edit?(by:)
    by == resource.user
  end
  alias_method :update?, :edit?

  def destroy?(by:)
    by == resource.user
  end

  def can_be_appriciated?(by:)
    by && by != resource.user \
      && !resource.appriciated?(by: by)
  end
end

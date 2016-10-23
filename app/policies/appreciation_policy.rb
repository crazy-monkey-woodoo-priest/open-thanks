class AppreciationPolicy
  attr_accessor :resource

  def can_be_destroyed?(by: )
    by && resource.user == by
  end
end

class ApplicationController < ActionController::Base
  include ExceptionsToStatusCodesConcern
  protect_from_forgery with: :exception

  private

  def policy
    @policy ||= policy_class.new
      .tap { |pol| pol.current_user = current_user }
      .tap { |pol| pol.resource = resource }
  end
  helper_method :policy

  def policy_class
    "#{resource.class}Policy".constantize
  end
end

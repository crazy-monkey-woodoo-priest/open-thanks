class ApplicationController < ActionController::Base
  include ExceptionsToStatusCodesConcern
  protect_from_forgery with: :exception

  private
end

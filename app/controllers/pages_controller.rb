class PagesController < ApplicationController
  def home
    @appreciations = Appreciation.ordered.first(16)
  end
end

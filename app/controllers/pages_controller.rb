class PagesController < ApplicationController
  def home
    @appreciations = Appreciation.ordered.last(20)
  end
end

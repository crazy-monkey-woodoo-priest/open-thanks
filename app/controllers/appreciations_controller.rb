class AppreciationsController < ApplicationController
  include ReceiversConcern
  before_action :set_receiver, only: [:create]

  def create
    @appreciation = current_user.appreciations.new(receiver: @receiver)
    @appreciation.save!

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@receiver]) }
    end
  end

  def destroy
    @receiver.destroy
    flash[:notice] = 'Receiver was deleted'
    redirect_to receivers_path
  end

  private
    def receiver_id
      params[:receiver_id]
    end
end

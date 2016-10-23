class AppreciationsController < ApplicationController
  include ReceiversConcern
  before_action :set_receiver, only: [:create]

  def create
    not_authorised unless @receiver.can_be_appriciated?(by: current_user)

    @appreciation = current_user.appreciations.new(receiver: @receiver)
    @appreciation.save!

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@receiver]) }
    end
  end

  def destroy
    @appreciation = Appreciation.find_param(params[:id])
    not_authorised unless @appreciation.policy.can_be_destroyed?(by: current_user)

    @appreciation.destroy
    flash[:notice] = 'Your Appreciation was deleted'
    redirect_to receiver_path(@appreciation.receiver)
  end

  private
    def receiver_id
      params[:receiver_id]
    end
end

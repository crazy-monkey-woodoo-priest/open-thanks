class ReceiversController < ApplicationController
  include ReceiversConcern
  before_action :set_receiver, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :latest]

  def index
    not_authorised unless ReceiverPolicy.index?(by: current_user)
    @header_text = I18n.t('receivers.index.header_text')
    @receivers = current_user.receivers.ordered.page(params[:page])
  end

  def latest
    not_authorised unless ReceiverPolicy.can_see_latest?(by: current_user)
    @header_text = I18n.t('receivers.latest.header_text')
    @receivers = Receiver.ordered.page(params[:page])
    render :index
  end

  def show
    not_authorised unless @receiver.policy.show?(by: current_user)
    @appreciation = @receiver.appreciations.new
    @appreciations = @receiver.appreciations.ordered.page(params[:page])
  end

  def new
    @receiver = Receiver.new
    not_authorised unless @receiver.policy.new?(by: current_user)
  end

  def edit
    not_authorised unless @receiver.policy.edit?(by: current_user)
  end

  def create
    @receiver =  current_user.receivers.new(permitter)
    not_authorised unless @receiver.policy.create?(by: current_user)
    if @receiver.save
      redirect_to receiver_path(@receiver)
    else
      render :new
    end
  end

  def update
    not_authorised unless @receiver.policy.update?(by: current_user)
    if @receiver.update(permitter)
      redirect_to receiver_path(@receiver)
    else
      render :edit
    end
  end

  def destroy
    not_authorised unless @receiver.policy.destroy?(by: current_user)

    @receiver.destroy
    flash[:notice] = 'Receiver was deleted'
    redirect_to receivers_path
  end

  private
    def resource
      @receiver
    end
    helper_method :resource

    def permitter
      params
        .require(:receiver)
        .permit(:title, :url, :description)
    end

    def receiver_id
      params[:id]
    end

    def user_id
      params[:user_id]
    end

    def policy_class
      ReceiverPolicy
    end
    helper_method :policy_class
end

class ReceiversController < ApplicationController
  before_action :set_receiver, only: [:edit, :update, :show, :destroy]

  def index
    @receivers = Receiver.ordered
  end

  def show
  end

  def new
    @receiver = Receiver.new
  end

  def edit
  end

  def create
    @receiver = Receiver.new(permitter)
    if @receiver.save
      redirect_to receiver_path(@receiver)
    else
      render :new
    end
  end

  def update
    if @receiver.update(permitter)
      redirect_to receiver_path(@receiver)
    else
      render :edit
    end
  end

  def destroy
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

    def set_receiver
      @receiver = Receiver.find_param(params[:id])
    end
end

class UsersController < ApplicationController
  def show
    @user = User.find_param(params[:id])
    @receivers = @user.receivers.ordered.page(params['page'])
    @header_text = "#{@user.nickname} receivers"
    render 'receivers/index'
  end
end

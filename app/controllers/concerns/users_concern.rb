module UsersConcern
  def set_user
    @receiver = User.find_param(user_id)
  end

  #def receiver_policy
    #@receiver_policy ||= ReceiverPolicy.new
      #.tap { |pol| pol.current_user = current_user }
      #.tap { |pol| pol.resource = @receiver }
  #end
end

module ReceiversConcern
  def set_receiver
    @receiver = Receiver.find_param(receiver_id)
  end
end

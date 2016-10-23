module StableHostHelper
  def badge_image(id)
    image_url("thanks-#{id}.svg",host: Rails.configuration.x.stable_host, protocol: 'https', port: nil)
  end

  def stable_url(receiver)
    receiver_url(receiver, host: Rails.configuration.x.stable_host, protocol: 'https', port: nil)
  end

end

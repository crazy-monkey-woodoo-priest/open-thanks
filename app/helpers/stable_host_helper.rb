module StableHostHelper
  def self.uri
    @stable_host_uri ||= URI.parse(Rails.configuration.x.stable_host)
  end

  def badge_image(id)
    image_url("thanks-#{id}.svg", host: StableHostHelper.uri.host , protocol: StableHostHelper.uri.scheme, port: StableHostHelper.uri.port)
  end

  def stable_url(receiver)
    receiver_url(receiver, host: StableHostHelper.uri.host , protocol: StableHostHelper.uri.scheme, port: StableHostHelper.uri.port)
  end
end

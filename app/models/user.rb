class User < ApplicationRecord
  include ParamConcern
  generate_public_uid
  devise :omniauthable, :omniauth_providers => [:github]
  has_many :receivers, dependent: :destroy
  has_many :appreciations, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
      user.nickname  = auth.info.nickname
      user.url       = auth.info.urls.GitHub
      user.image_url = auth.info.image
      user.save
    end
  end

  has_many :appreciations
end

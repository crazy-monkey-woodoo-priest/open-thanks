class User < ApplicationRecord
  include ParamConcern
  generate_public_uid

  has_many :appreciations
end

class Appreciation < ApplicationRecord
  include ParamConcern
  generate_public_uid

  belongs_to :user
  belongs_to :receiver
end

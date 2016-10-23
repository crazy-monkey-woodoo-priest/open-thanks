class Appreciation < ApplicationRecord
  include ParamConcern
  generate_public_uid

  scope :ordered, -> { order(id: :desc) }

  belongs_to :user
  belongs_to :receiver
end

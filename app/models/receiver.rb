class Receiver < ApplicationRecord
  include ParamConcern
  generate_public_uid

  has_many :appreciations

  scope :ordered, -> { order(id: :desc) }

  validates_presence_of :url
  validates_presence_of :title
end

class Appreciation < ApplicationRecord
  include ParamConcern
  generate_public_uid

  scope :ordered, -> { order(id: :desc) }

  belongs_to :user
  belongs_to :receiver

  validates_presence_of :user, :receiver

  def policy
    @policy ||= AppreciationPolicy.new.tap { |ap| ap.resource = self }
  end
end

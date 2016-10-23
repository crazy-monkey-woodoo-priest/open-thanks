class Receiver < ApplicationRecord
  include ParamConcern
  generate_public_uid

  has_many :appreciations, dependent: :destroy
  belongs_to :user

  scope :ordered, -> { order(id: :desc) }

  validates_presence_of :url
  validates_presence_of :title
  validates_presence_of :user

  def appriciated?(by:)
    by && appreciations
      .pluck(:user_id)
      .include?(by.id)
  end

  def appreciations_count
    appreciations.count
  end
end

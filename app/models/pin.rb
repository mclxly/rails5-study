class Pin < ApplicationRecord
  belongs_to :board

  extend FriendlyId
  friendly_id :name, use: :slugged
end

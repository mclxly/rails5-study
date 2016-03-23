class Pin < ApplicationRecord
  belongs_to :board

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ImageUploader

  paginates_per 2
end

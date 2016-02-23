class Board < ApplicationRecord
  has_many :pins
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged
end

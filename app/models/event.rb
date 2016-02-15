class Event < ApplicationRecord
  belongs_to :organizers, class_name: "User", optional: true

  # validates :organizer_id,presence: false, allow_nil: true
end
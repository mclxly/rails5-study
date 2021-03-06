class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id"

  has_many :attendances
  has_many :events, :through => :attendances

  has_many :boards

  has_and_belongs_to_many :organizations
end

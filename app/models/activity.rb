class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :title, :description, :maximum_attendees, :ticket_price, :date, presence: :true
end

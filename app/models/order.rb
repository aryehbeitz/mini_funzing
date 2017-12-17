class Order < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :number_of_tickets, :total_price, :activity_id, :user_id, presence: :true
end

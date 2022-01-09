class Booking < ApplicationRecord

  default_scope { order("created_at DESC") }
  
  belongs_to :user
  belongs_to :service

  validates_presence_of :date_time, :payment_reference, :service_id
end

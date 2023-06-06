class Product < ApplicationRecord
  include ProductConcern
  belongs_to :user
  has_many :bookings
end

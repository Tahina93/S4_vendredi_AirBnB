class Accomodation < ApplicationRecord
  validates :available_beds, presence: true, numericality: {greater_than: 0}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true, length: {minimum: 140}
  validates :welcome_message, presence: true

  belongs_to :city
  belongs_to :owner, class_name: "User"

  has_many :bookings, foreign_key: 'rented_accomodation_id'
  has_many :guests, foreign_key: 'guest_id', class_name: "User", through: :bookings


  def overlaping_reservation?(start, stop)
    self.bookings.each do
      |b|
      if (start..stop).overlaps?(b.start..b.end)
        return true
      end
    end
    return false
  end
end

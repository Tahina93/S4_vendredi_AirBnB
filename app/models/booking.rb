class Booking < ApplicationRecord
  validate :start_must_be_before_end_date
  belongs_to :guest, class_name: "User"
  belongs_to :rented_accomodation, class_name: "Accomodation"
end

def start_must_be_before_end_date
  errors.add(:start_date, "must be before end date") unless
    start_date < end_date
end 
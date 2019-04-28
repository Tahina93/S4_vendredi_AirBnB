class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.references :rented_accomodation, index: true
      t.references :guest, index: true

      t.timestamps
    end
  end
end

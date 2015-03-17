class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :departing_time
      t.string :duration
      t.integer :from_airport_id
      t.integer :to_airport_id

      t.timestamps
    end
  end
end

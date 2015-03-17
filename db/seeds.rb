# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
Airport.create!(code:  "SFO")
Airport.create!(code:  "NYC")

Flight.create!(departing_time:  DateTime.new(2015,5,11,8), duration: "2hrs", to_airport_id: 2, from_airport_id: 1)
Flight.create!(departing_time:  DateTime.new(2015,5,12,5), duration: "2hrs", to_airport_id: 2, from_airport_id: 1)
Flight.create!(departing_time:  DateTime.new(2015,5,15,7,30), duration: "2hrs", to_airport_id: 2, from_airport_id: 1)

Flight.create!(departing_time:  DateTime.new(2015,5,12,9), duration: "2hrs 30min", to_airport_id: 1, from_airport_id: 2)
Flight.create!(departing_time:  DateTime.new(2015,5,12,13), duration: "2hrs 30min", to_airport_id: 1, from_airport_id: 2)
Flight.create!(departing_time:  DateTime.new(2015,5,13,8), duration: "2hrs 30min", to_airport_id: 1, from_airport_id: 2)
Flight.create!(departing_time:  DateTime.new(2015,5,16,6,45), duration: "2hrs 30min", to_airport_id: 1, from_airport_id: 2)
Flight.create!(departing_time:  DateTime.new(2015,5,22,10), duration: "2hrs 30min", to_airport_id: 1, from_airport_id: 2)

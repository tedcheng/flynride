# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create( [
	{phone_no:'+12536938705' , token: '12222' ,confirm_code: '123'},
	{phone_no:'+16083386540' , token: '12223' ,confirm_code: '123'},
	{phone_no:'+13152100209' , token: '12224' ,confirm_code: '123'},
	{phone_no:'+14159751399' , token: '12224' ,confirm_code: '123'},

])

flight = Flight.create([
	{flight_no: "EK226", date: Date.new(2013,9,22)},
	{flight_no: "EK225", date: Date.new(2013,9,22)}
])

rider = Rider.create([
	{user_id:1, flight_id:2, final_dest: "255 King Street, San Francisco,CA"},
	{user_id:2, flight_id:2, final_dest: "94110"},
	{user_id:3, flight_id:2, final_dest: "Potrero Avenue and Mariposa Street, San Francisco"}
])

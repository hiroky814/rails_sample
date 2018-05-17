# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# user
records = []
CSV.foreach('db/user.csv') do |row|
  records << User.new(
		name: row[0],
		age: row[1],
		graduate: row[2],
		hobby: row[3]
	)
end
User.import records

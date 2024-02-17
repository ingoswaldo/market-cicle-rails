# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
return if Rails.env.test?

puts "Starting importing initial..."

begin
  Importers::InitialDbJsonImporter.call
  puts "importing initial done!..."
rescue => error
  puts "importing initial fails. Error: #{error.message}"
end

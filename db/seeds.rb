# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#@images = Dir.glob("app/assets/images/database/*")

#for image in @images
# Photo.create(image: "database/#{image.split('/').last}", label: '', description:'')
#end
require 'csv'
CSV.foreach(Rails.root.join('app/assets/images/path_images.csv'), headers: false) do |row|
  Photo.create(image: row[0], label: '', description: '')
end

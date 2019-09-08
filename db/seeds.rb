# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create!([
{ "name": "Osaka", "latitude": "39.7595063","longitude": "-104.9861053"},
{ "name": "Domo Japanese Country Food", "latitude": "39.7382478", "longitude": "-105.0055633"},
{ "name": "Tokio", "latitude": "39.7586035", "longitude": "-104.9974398"}
])

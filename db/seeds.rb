# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
beer_category = Category.create(name: "beer")
vegatables_category = Category.create(name: "vegatables")
wine_category = Category.create(name: "wine")

Product.create(name: "Teteriv", price: 3.43, category: beer_category)
Product.create(name: "Lvivske", price: 4.17, category: beer_category)

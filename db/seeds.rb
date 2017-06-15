# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Product.create! id: 1, name: "Pao", description: "Feito de Trigo", price: 0.20, categories: "cafedamanha"
Product.create! id: 2, name: "Manteiga", description: "Salgada", price: 0.30, categories: "cafedamanha"
Product.create! id: 3, name: "Sal", description: "Com iodo", price: 0.40, categories: "condimentos"
Product.create! id: 4, name: "Açucar", description: "Refinado", price: 1.40, categories: "condimentos"
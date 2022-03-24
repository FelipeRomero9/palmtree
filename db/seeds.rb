# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Product.destroy_all

User.create!(email: 'admin@mail.com', password: '12345678')
User.create!(email: 'test_user@mail.com', password: '12345678')

Product.create!(name: 'Macbook',
                description: 'This macbook is the fastest computer of the year, featuring the M1 chip',
                price: 2400)
Product.create!(name: 'Book',
                description: 'This  is the a book, you can read it',
                price: 49)
Product.create!(name: 'Flower',
                description: 'The perfect gift',
                price: 10)

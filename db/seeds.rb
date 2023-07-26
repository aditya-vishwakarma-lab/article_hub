# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(email: 'author@mintbit.com', password: '123123', password_confirmation: '123123', user_type: 'author')
User.create(email: 'admin@mintbit.com', password: '123123', password_confirmation: '123123', user_type: 'admin')

User.create(email: 'reader@mintbit.com', password: '123123', password_confirmation: '123123', user_type: 'reader')


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Computer', email: 'computer@computer.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Paul', email: 'paul@paul.com', password: 'password', password_confirmation: 'password')


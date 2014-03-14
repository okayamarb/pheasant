# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role = Role.create!(name: '管理者', code: 'admin')
user = User.create(email: 'admin@email.com', password: 'password', password_confirmation: 'password', role: role)
user.ensure_authentication_token!
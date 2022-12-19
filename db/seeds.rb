# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "北海道")
Category.create(name: "東北地方")
Category.create(name: "関東地方")
Category.create(name: "中部地方")
Category.create(name: "近畿地方")
Category.create(name: "中国地方")
Category.create(name: "四国地方")
Category.create(name: "九州地方")
Category.create(name: "海外")

Admin.create(
    email: 'admin@test',
    password: '123456'
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!(
  [
    {name: '北海道'},
    {name: '東北地方'},
    {name: '関東地方'},
    {name: '中部地方'},
    {name: '近畿地方'},
    {name: '中国地方'},
    {name: '四国地方'},
    {name: '九州地方'},
    {name: '海外'},
  ]
)

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password'},
    {email: 'james@test.com', name: 'James', password: 'password'},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password'}
  ]
)

Post.create!(
  [
    {place: '北海道最北端！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), description: '日本最北端の宗谷岬です！', latitude: 45.52290338784266, longitude: 141.93659484386444, user_id: users[0].id, category_id: categories[0].id },
    {place: '東京タワー！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), description: '東京のシンボル！東京タワーー！', latitude: 35.6586212780812, longitude: 139.7454071044922, user_id: users[1].id, category_id: categories[2].id },
    {place: 'ちゅらうみ水族館！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), description: '全人類が一度は行ってみたい！美ら海水族館です！', latitude: 26.694398023169406, longitude: 127.8779411315918, user_id: users[2].id, category_id: categories[7].id }
  ]
)

Admin.create(
    email: 'admin@test',
    password: '123456'
)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.find_or_create_by(id: 1) do |admin|
 admin.email = "example@example.com"
 admin.password = "example"
end
  #本番環境時は.env利用と、gitignoreへの記載要!!

  Customer.create!(
   email: 'test@test.com',
   last_name: 'テスト',
   first_name:'太郎',
   last_name_kana: 'テスト',
   first_name_kana: 'タロウ',
   password: 'example',
   post_code: '1111111',
   address: 'n県n市',
   telephone_number: '0120333906',
   is_active: true
)

Customer.all.each do |customer|
  customer.addresses.create!(
    name: 'テスト花子',
    post_code: '1234567',
    address: 'a県b市'
  )
end

Genre.create!(
  name: 'ケーキ'
  )
  
  
item = Item.new(
  name: 'いちごのショートケーキ',
  introduction: 'とっても甘いショートケーキです。',
  price: '3000',
  genre_id: Genre.find_by(name: 'ケーキ').id,
  is_active: 'false')
item.image.attach('./app/assets/images/default-image.jpg')
item.save!

  
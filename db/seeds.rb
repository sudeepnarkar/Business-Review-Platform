# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Review.destroy_all
Business.destroy_all
User.destroy_all

for i in 0..10 do
    Business.create!(name: "Bus#{i}")
    User.create!(name:"Usr#{i}", password_hash: "password#{i}")
end

bus = Business.all
usr = User.all

bus.each do |b|
    usr.each do |u|
        rnd = Random.new     
        rate = rnd.rand(1..5)
        r = Review.create!(stars: rate, create_date: Time.now, description: "Wowee, this place is great!")
        b.reviews << r
        u.reviews << r
    end
end


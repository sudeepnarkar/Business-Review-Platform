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
    User.create!(name:"Usr#{i}", password_hash: "password", email: "email#{i}@email.com")
end


client = GooglePlaces::Client.new("AIzaSyAN1LO4ZST-Qr-_o7q2MqGBNafA9d_VEBM")
#lat & lng aprox. bu
long = -75.9652296 
lat = 42.0896417

#Retrieve a colection of nearby places. 
places = client.spots(lat, long, :radius => 100000)

num = 0

places.each do |pl|
    b = Business.create!(name: pl.name, lat: pl.lat, lng: pl.lng, email: "email#{num}@email.com", password_hash: "password", place_id: pl.id)
    pl.types.each do |t|
       type = Type.find_or_create_by(name: t)
       b.types << type
    end
end

#p Business.last

bus = Business.all
usr = User.all


bus.each do |b|
    i = 0;
    usr.each do |u|
        rnd = Random.new     
        rate = rnd.rand(1..5)
        r = Review.create!(stars: rate, create_date: (Date.today - (5 * i)), description: "Wowee, this place is great!", business_id: b.id)
        #b.reviews << r
        u.reviews << r
        i = i + 1
    end
end


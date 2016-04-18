class ReviewsController < ApplicationController
    def new
        # Retrieve coordinate using the client's ip address
        
        @ip = request.remote_ip
        p @ip
        #location = Geocoder.coordinates(@ip)
        #location = request.location
        location = Geokit::Geocoders::MultiGeocoder.geocode(@ip)
        @test = location.ll.inspect
        #location = Geocoder.search(@ip)
        #latitude = location[0]
        #longitude = location[1]
    end
    
    
end
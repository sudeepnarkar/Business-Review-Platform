class ReviewsController < ApplicationController
    def new
        # Retrieve coordinate using the client's ip address
        
        @ip = request.remote_ip
        p @ip
        
        location = Geokit::Geocoders::IpGeocoder.geocode(@ip)
        @zip = request.location.city
        #@zip = location.inspect
        #@zip = Geocoder.search(@ip)["zipcode"]
    end
    
    
end
class ReviewsController < ApplicationController
    def new
        # Retrieve coordinate using the client's ip address
        
        @ip = request.remote_ip
        p @ip
        location = Geocoder.search(@ip)
        latitude = location[latitude]
        longitude = location[longitude]
    end
    
    
end
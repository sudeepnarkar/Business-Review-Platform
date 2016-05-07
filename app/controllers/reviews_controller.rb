class ReviewsController < ApplicationController
    #after_save :update_business_average
    @@GOOGLE_PLACES_KEY = "AIzaSyAN1LO4ZST-Qr-_o7q2MqGBNafA9d_VEBM"
    
    def new
        # Retrieve coordinate using the client's ip address
        @ip = request.remote_ip
        @client = GooglePlaces::Client.new(@@GOOGLE_PLACES_KEY)
        p @ip
        location = Geokit::Geocoders::MultiGeocoder.geocode(@ip)
        long = location.longitude
        lat = location.latitude
        #@test = location.longitude #l.inspect
        #p @test
        
        #Retrieve a colection of nearby places. 
        @places = @client.spots(lat, long, :radius => 1000)
        
        p @places.inspect
        
    end
    
    
    protected
        def update_business_average
           self.business.average = self.business.get_avg_rating 
           self.business.save!
        end
end
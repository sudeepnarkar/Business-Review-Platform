class ReviewsController < ApplicationController
    after_save :update_business_average
    
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
    
    
    protected
        def update_business_average
           self.business.average = self.business.get_avg_rating 
           self.business.save!
        end
    
end
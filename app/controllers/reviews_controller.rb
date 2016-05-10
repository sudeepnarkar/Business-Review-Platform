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
        p lat
        p long
        @places = {}
        #Don't attempt to display places without valid coordinates.
        unless lat.nil? || long.nil?
            #@test = location.longitude #l.inspect
            #p @test
            #Retrieve a colection of nearby places. 
            @places = @client.spots(lat, long, :radius => 10000)
            p @places.inspect
        end
    end
    
    def create
=begin
      p "happy."
      p session[:user]
      @review = Review.create! :stars => params["review"]["stars"],:description => params["review"]["description"], :business_id => params["review"]["business_id"]
        flash[:warning] = "Params: #{params.inspect}"
=end
        p "happy."
        p session[:user]
        #this is what I added
        if session[:user].nil?
           flash[:notice] = "You are not logged in!"
           redirect_to root_path
        end
        if params["review"]["business_id"].nil? or params["review"]["stars"].nil?
            flash[:notice] = "incorrect parameters"
        end
        bus = Business.find_or_create_by(:place_id => params["review"]["business_id"])
        p bus.inspect
        p @places
        @review = Review.create! :stars => params["review"]["stars"],:description => params["review"]["description"],:business_id => bus.id, :create_date => Time.now
        
        redirect_to user_path(session[:user]["id"])
    end
    

    protected
        def update_business_average
           self.business.average = self.business.get_avg_rating 
           self.business.save!
        end

end
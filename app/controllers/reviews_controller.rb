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
        
        @test=@ip 
        @lat =lat
        @long =long
        
        
        unless lat.nil? || long.nil?
            #@test = location.longitude #l.inspect
        
            #Retrieve a colection of nearby places. 
            @places = @client.spots(lat, long, :radius => 10000000)
            
            p @places.inspect
        end
    end
    
    def create
        #@client = GooglePlaces::Client.new(@@GOOGLE_PLACES_KEY)
        
=begin
      p "happy."
      p session[:user]
<<<<<<< HEAD
<<<<<<< HEAD
      @review = Review.create! :stars => params["review"]["stars"],:description => params["review"]["description"],:business_id => params["review"]["business_id"]
        redirect_to new_review_path(session[:user]["id"])
=======
=======
>>>>>>> BRP-MAIN/master
      @review = Review.create! :stars => params["review"]["stars"],:description => params["review"]["description"], :business_id => params["review"]["business_id"]
        flash[:warning] = "Params: #{params.inspect}"
=end
        #@client = GooglePlaces::Client.new(@@GOOGLE_PLACES_KEY)

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
        
        
        @review = Review.create! :user_id => session[:user]["id"], :stars => params["review"]["stars"],:description => params["review"]["description"],:business_id => bus.id, :create_date => Time.now

        #placename = @client.spot("CnRwAAAA6EyzXtPaKdwIVcdvNiIkc2NN4Xonza3dDrYf2NFlO41zbmlX0Q5wwci0nHHeDYy_iGpvK7FEn3Fn4Ql8p13OuxD00y-kNhAISR-iCFv20wk2nlQ1zontoQA_YEp18R1QrT1kwa6-pV2qDBrUv6ooahIQUZwcyWaY1jPMks9hd4G6QBoUSssjHlHf_wszuJWKT6PlogEYvjo")
        flash[:notice] = bus.id

        redirect_to user_path(session[:user]["id"])
    end
    

    protected
        def update_business_average
           self.business.average = self.business.get_avg_rating 
           self.business.save!
        end

end
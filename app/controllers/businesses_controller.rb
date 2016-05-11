class BusinessesController < ApplicationController
    @@GOOGLE_PLACES_KEY = "AIzaSyAN1LO4ZST-Qr-_o7q2MqGBNafA9d_VEBM"
    @@MAX_DIST = 30
    def index
        p params.inspect
        #cond.merge({:all})
        #unless (session[:location].nil?)
        #    @location = session[:location]
        #else
        @loc = []
        ip = request.remote_ip
        client = GooglePlaces::Client.new(@@GOOGLE_PLACES_KEY)
        @location = Geokit::Geocoders::MultiGeocoder.geocode(ip)
        #end
        @loc = [@location.lat, @location.lng]
        p @loc
        @u = session[:user] || User.create!(name: 'temp_user')
        #p u.inspect
        #p Business.all
        p @loc[0].to_f
        p @loc[1].to_f
        min_lat = @loc[0].to_f - ((0.017)*(@@MAX_DIST))
        max_lat = @loc[0].to_f + (0.017)*(@@MAX_DIST)
        min_lng = @loc[1].to_f - ((0.017)*(@@MAX_DIST))
        max_lng = @loc[1].to_f + (0.017)*(@@MAX_DIST)
        bus_loc = Business.where(:lat => (min_lat)..(max_lat), :lng => (min_lng)..(max_lng))
        p bus_loc.inspect
        bus_loc.each do |b|
            Distance.find_or_create_by(:dist => @location.distance_to(b), :business_id => b.id, :user_id => @u["id"])
        end
        p Distance.all.inspect
        
        #cond.merge({:origin => @loc})
        dist = params[:dist] || session[:dist] || @@MAX_DIST
        dist = dist.to_i
        cond = {:dist => 0..dist, :user_id => @u["id"]}
        sort = params[:sort] || session[:sort] || []
        if sort == 'dist'
            order = 'dist ASC'
        elsif sort == 'name'
            order = 'businesses.name ASC'
        else
            order = 'businesses.average DESC'
        end
        unless session[:sort] == params[:sort] and session[:dist] == params[:dist]
            session[:sort] = params[:sort]
            session[:dist] = params[:dist]
            redirect_to businesses_path(:sort => sort, :dist => dist)
        end
        dist_list = Distance.includes(:business).where(cond).order(order).distinct
        p dist_list.inspect
        @bus = []
        dist_list.each do |d|
           @bus.push(Business.find(d.business_id))
        end
        
        p @bus.inspect
        #@bus = bus_loc.distances.where(cond)
        
    end
    
    def show
        id = params[:id]
        @bus = Business.find(id)
        @revs = @bus.reviews.order("create_date DESC")
    end
    

   
   def profile
       @bus = Business.find(params[:id])
       #p @bus.inspect
       @avg = @bus.average
       p @bus.average
       @rate = @bus.where_am_i_overall([@bus.lat, @bus.lng], 30)
       p @rate
       @rt = []
       @bus.types.each do |t|
          r = @bus.where_am_i_type([@bus.lat, @bus.lng], 30, t)
          r.push(t.name)
          @rt.push(r)
       end
       p @rt
       p Business.all.count
       avg_this_week = @bus.get_avg_rating_time(Date.today - 7, Date.today)
       avg_last_week = @bus.get_avg_rating_time(Date.today - 14, Date.today - 7)
        if (avg_last_week != nil and avg_this_week != nil)
            if(avg_this_week > avg_last_week)
                @message_week = "Ratings are up from last week by #{(avg_this_week - avg_last_week).round(2)}"
            elsif (avg_this_week < avg_last_week)
                @message_week = "Ratings are down this week by #{(avg_last_week - avg_this_week).round(2)}"
            else
                @message_week = "Rating are the same between this week and last week"
            end
        else
            @message_week = "There aren't enough reviews to compare between weeks!"
        end       
        avg_this_month = @bus.get_avg_rating_time(Date.today - 30, Date.today)
        avg_last_month = @bus.get_avg_rating_time(Date.today - 60, Date.today - 30)
        if (avg_last_month != nil and avg_this_month != nil)
            if(avg_this_month > avg_last_month)
                @message_month = "Ratings are up from last month by #{(avg_this_month - avg_last_month).round(2)}"
            elsif (avg_this_month < avg_last_month)
                @message_month = "Ratings are down this month by #{(avg_last_month - avg_this_month).round(2)}"
            else
                @message_month = "Rating are the same between this month and last month"
            end
        else
            @message_month = "There aren't enough reviews to compare between months!"
        end      
   end
   


# GET /users/new
  def new
    #@user = User.new
  end


def login
end  

def logout
    session.clear
    cookies.clear
    redirect_to(root_path)
end

 def validate
   p params
   @business = Business.find_by(:email => params[:business][:email],:password_hash => params[:business][:password_hash])
   p @business.inspect
   if @business != nil
     p "Happy path inside validate"
     session[:business] = @business
     redirect_to profile_business_path(@business.id)
   else
     p "sad path inside validate"
     redirect_to business_login_path
   end

    #if @user = User.authenticate(params[:email], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      #session[:user] = @user
 
 end
 
  # POST /users
  # POST /users.json
  
  def create
    
    
    #p params
    #p params["user"]["email"] =~ /^.+$/
    #p params["user"]["confirm"].eql? params["user"]["password"]
    if params["user"]["email"] =~ /^.+$/ and 
      params["user"]["password"] =~ /^.+$/ and 
      params["user"]["confirm"].eql? params["user"]["password"]
      
      p "happy."
      @business = Business.create! :email => params["user"]["email"],
        :password_hash => params["user"]["password"], :average => 0
        
      #p ">>>user id #{@user.id}"
      session[:business] = @business
      redirect_to profile_business_path(@business.id)
    else
      p "sad."
      flash[:warning] = "Please fill in all required fields."
      redirect_to new_business_path
    end
    
    
    #@user.update_attributes!(user_params)
    p @business
    #flash[:notice] = "#{@user.title} was successfully updated."
    #redirect_to movie_path(@user)
    #@user = User.create!(user_params)
    
    #p user_params
    #p @user
    #params[:id] = @user.id
    

    #respond_to do |format|
    #  if @user.save
    #    format.html { redirect_to @user, notice: 'User was successfully created.' }
    #    format.json { render :show, status: :created, location: @user }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
    #end
  end
end
  
  
   
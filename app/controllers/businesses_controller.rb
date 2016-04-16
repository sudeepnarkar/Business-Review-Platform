class BusinessesController < ApplicationController
    
    def show
        id = params[:id]
        @bus = Business.find(id)
        @revs = @bus.reviews
    end
   
   def profile
       @bus = Business.find(params[:id])
       @avg = @bus.get_avg_rating
       avg_this_week = @bus.get_avg_rating_time(Date.today - 7, Date.today)
       avg_last_week = @bus.get_avg_rating_time(Date.today - 14, Date.today - 7)
        if (avg_last_week != nil and avg_this_week != nil)
            if(avg_this_week > avg_last_week)
                @message = "Ratings are up from last week"
            elsif (avg_this_week < avg_last_week)
                @message = "Ratings are down this week"
            else
                @message = "Rating are the same between this week and last week"
            end
        else
            @message = "There aren't enough reviews to compare between weeks!"
        end       
   end
    
end
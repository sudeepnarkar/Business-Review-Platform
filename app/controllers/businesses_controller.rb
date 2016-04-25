class BusinessesController < ApplicationController
    
    def show
        id = params[:id]
        @bus = Business.find(id)
        @revs = @bus.reviews
    end
   
   def profile
       @bus = Business.find(params[:id])
       #p @bus.inspect
       @avg = @bus.average
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
    
end
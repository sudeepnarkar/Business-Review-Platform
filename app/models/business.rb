class Business < ActiveRecord::Base
    has_many :reviews 
    acts_as_mappable 
   
    def get_avg_rating
       self.reviews.average("stars")
    end
    
    def get_avg_rating_time(time1, time2)
        self.reviews.where(create_date: time1..time2).average("stars")
    end
end
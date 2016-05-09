class Business < ActiveRecord::Base
    has_many :reviews 
    acts_as_mappable
    has_and_belongs_to_many :types
    has_many :distances
    has_many :users, through: :distances
    def get_avg_rating
       self.reviews.average("stars")
    end
    
    def get_avg_rating_time(time1, time2)
        self.reviews.where(create_date: time1..time2).average("stars")
    end
    
    def get_rev_count(time1, time2)
       self.reviews.where(create_date: time1..time2).count
    end
    
    def where_am_i_overall(loc, dist)
        list = Business.within(dist, :origin => loc).order('average DESC').distinct
        self.get_place(list)
    end
    
    def where_am_i_type(loc, dist, t)
        list = t.businesses.within(dist, :origin => loc).order('average DESC').distinct
        self.get_place(list)
    end
    
    def get_place(list)
        c = list.count
        if (list.find_index(self) != nil)
            better = list.find_index(self) + 1
        else
            better = nil
        end
        #avg = self.get_avg_rating
        #better = 0
        #list.each do |b|
        #    if b.get_avg_rating > avg
        #        better += 1
        #    end
        #end
        [better, c]
    end
    
end
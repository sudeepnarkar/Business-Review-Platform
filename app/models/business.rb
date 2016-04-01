class Business < ActiveRecord::Base
    has_many :reviews 
    acts_as_mappable 
    
end
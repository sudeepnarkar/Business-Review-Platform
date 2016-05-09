class Review < ActiveRecord::Base
   #after_save :update_business_average
   belongs_to :business
   belongs_to :user
    
end
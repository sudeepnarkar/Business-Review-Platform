class Review < ActiveRecord::Base
   belongs_to :business
   belongs_to :user_stub
    
end
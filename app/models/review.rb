class Review < ActiveRecord::Base
   after_save :update_business_average
   belongs_to :business
   belongs_to :user
    
    
   protected
      def update_business_average
         self.business.average = self.business.get_avg_rating
         self.business.save!
      end
end
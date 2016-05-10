class User < ActiveRecord::Base
    has_many :reviews 
    acts_as_mappable
    has_many :distances
    has_many :businesses, through: :distances
end

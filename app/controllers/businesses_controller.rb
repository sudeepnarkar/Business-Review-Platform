class BusinessesController < ApplicationController
    
    def show
        id = params[:id]
        @bus = Business.find(id)
        @revs = @bus.reviews
    end
    
end
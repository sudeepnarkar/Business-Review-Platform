require 'rails_helper'

describe ReviewsController do
    describe '#new' do
        it 'Calls the correct geocoder method' do
            request.stub(:remote_ip).and_return "71 Harris Road, Katonah, NY 10536"
            expect(Geocoder).to receive(:coordinates)
            #expect(request).to receive(:location) 
            post :new
        
        end
        
        it 'Returns a more or less correct set of coordinates given an ip 
            address.' do
            request.stub(:location)
               
            post :new
                
        end
    end
end
        
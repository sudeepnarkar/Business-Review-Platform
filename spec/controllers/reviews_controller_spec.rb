require 'rails_helper'

describe ReviewsController do

    describe '#new' do
        it 'Calls the correct geocoder method' do
            my_ip = "1.1.1.1.1"
            my_coords = double("my_coords", :ll => "40.000, 40.0000")
            request.stub(:remote_ip).and_return my_ip
            expect(Geokit::Geocoders::MultiGeocoder).to receive(:geocode).
                with(my_ip).and_return(my_coords)
            #expect(request).to receive(:location) 
            post :new
        end
    end
end
        
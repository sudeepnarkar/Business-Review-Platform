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
    
    describe '#create' do
        before :each do
            #test comments
            @review_params = {:stars => "4", :description => "Nice Outlet", :business_id => "123" }
        end
        
        context "when review parameters are provided" do
            it "creates a new review in database" do
                session[:user] = {}
                session[:user]["id"] = 1
                expect(Review).to receive(:create!).with({:stars => "4", :description => "Nice Outlet", :business_id => "123"})
                post :create, :review => @review_params
                
            end
            
            it "redirects to user's show page" do
                session[:user] = {}
                session[:user]["id"] = 1
                expect(Review).to receive(:create!).with({:stars => "4", :description => "Nice Outlet", :business_id => "123"})
                post :create, :review => @review_params
                expect(response).to redirect_to(user_path(1))
            
            end
        end
    end
end
        
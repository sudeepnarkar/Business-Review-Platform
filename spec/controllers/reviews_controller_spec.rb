require 'rails_helper'


describe ReviewsController do

    

    describe '#create' do
        before :each do
            #test comments
            @review_params = {:stars => "4", :description => "Nice Outlet", :business_id => "123" }
        end
        
        context "when review parameters are provided" do
            it "creates a new review in database" do
                session[:user] = {}
                session[:user]["id"] = 1
                
                expect(Review).to receive(:create!).with({:user_id => 1, :stars => "4", :description => "Nice Outlet", :business_id => 1, :create_date => Time.now})
                post :create, :review => @review_params
                
            end
            
            it "redirects to user's show page" do
                session[:user] = {}
                session[:user]["id"] = 1
                expect(Review).to receive(:create!).with({:user_id => 1, :stars => "4", :description => "Nice Outlet", :business_id => 1, :create_date => Time.now})
                post :create, :review => @review_params
                expect(response).to redirect_to(user_path(1))
            
            end
        end
    end
end
        
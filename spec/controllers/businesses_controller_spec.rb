require "rails_helper"

RSpec.describe BusinessesController, :type => :controller do
   
   describe "GET #show" do
        before(:each) do
            @bus = Business.create!(:name => "fake business")
        end
        after(:each) do
           @bus.delete
        end
        
        it "renders the show template" do
            get :show, :id => @bus.id
            expect(response).to render_template("show")
        end
        
        it "responds successfully" do
            get :show, :id => @bus.id
            expect(response).to be_success
        end
       
   end
    
    
end
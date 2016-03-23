require "rails_helper"

RSpec.describe UsersController, :type => :controller do
   
   describe "GET #show" do
        before(:each) do
            @usr = User.create!(:name => "fake user")
        end
        after(:each) do
           @usr.delete
        end
        
        it "renders the show template" do
            get :show, :id => @usr.id
            expect(response).to render_template("show")
        end
        
        it "responds successfully" do
            get :show, :id => @usr.id
            expect(response).to be_success
        end
       
   end
    
    
end
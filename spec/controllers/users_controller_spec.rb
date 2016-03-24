require 'rails_helper'

describe UsersController do
    describe '#create' do
        before :each do
            @user_params = {:email => "jdoe", :password_hash => "146347", :password_salt => "1231"}
            @sad_params = {:email => "", :password_hash => "146347", :password_salt => "1231"}
            @next_uid = "1"
            @new_user = double('John Doe', :id => @next_uid) 
        end
        context "when valid parameters are provided" do
            it "creates a new movie if parameters are valid" do
                expect(User).to receive(:create!).with(@user_params).and_return @new_user
                
                post :create, :user => @user_params
                #expect(response).to redirect_to(user_path)
            end
            
            it "redirects to the show page" do
                local_usr = double('local_usr', :id => "1")
                User.stub(:create!).and_return local_usr
                post :create, :user => @user_params
                expect(response).to redirect_to(user_path(:id => "1"))
            end
        end
        context "when the is incorrectly formatted" do
            it "Does not create a new movie" do
                expect(User).to_not receive(:create!).with(@sad_params)
                post :create, :user => @sad_params
                #expect(response).to redirect_to(user_path)
            end
            it "redirects to the new page" do
                local_usr = double('local_usr', :id => "1")
                User.stub(:create!).and_return  local_usr
                post :create, :user => @sad_params
                expect(response).to redirect_to(new_user_path)
            end
            
            
        end
        
        
    end
end

    
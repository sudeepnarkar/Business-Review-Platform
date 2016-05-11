require 'rails_helper'

describe UsersController do
    
     describe "profile" do
        
        it "redirects to ur profile if logged in" do
            new_usr = double("John Doe", :id => 1)
            session[:user] = {}
            session[:user]["name"] = "John Doe"
            session[:user]["id"] = 1
            get :profile
            expect(response).to redirect_to(user_path(1))
        end
        
        it "redirects to the login page if not" do
            get :profile
            expect(response).to redirect_to(root_path)
        end
       
   end
   
   describe "GET #show" do
        before(:each) do
            @usr = User.create!(:name => "fake user")
        end
        after(:each) do
           @usr.delete
        end
        
        it "renders the show template if logged in" do
            session[:user] = @usr.as_json
            get :show, :id => @usr.id
            expect(response).to render_template("show")
        end
        
        it "redirects to root if logged in as another" do
            new_user = double("New Guy", :id => 2)
            session[:user] = new_user.as_json
            get :show, :id => @usr.id
            expect(response).to redirect_to(root_path)
        end
       
   end
   
    describe '#create' do
        before :each do
            @good_conf = "146347"
            @user_params = {:email => "jdoe", :password => "146347", :confirm => @good_conf, :password_salt => "1231"}
            @sad_params = {:email => "", :password => "146347", :confirm => @good_conf, :password_salt => "1231"}
            @next_uid = "1"
            @new_user = double('John Doe', :id => @next_uid) 
        end
        context "when valid parameters are provided" do
            it "creates a new movie if parameters are valid" do
                expect(User).to receive(:create!).with({:email => "jdoe", :password_hash => "146347"}).and_return @new_user
                
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
    
    
     describe '#validate' do
        before :each do
            @good_conf = "146347"
            @user_params = {:email => "jdoe", :password_hash => "146347", :password_salt => "1231"}
            @sad_params = {:email => "", :password_hash => "146347", :password_salt => "1231"}
            @next_uid = "1"
            @new_user = double('John Doe', :id => @next_uid)
            
        end
        context "when valid parameters are provided" do
            it "checks if user is already in database" do
                expect(User).to receive(:find_by).with(:email => "jdoe", :password_hash => "146347").and_return @new_user
                post :validate, :user => @user_params
            end
            
            it "redirects to the user's profile page" do
                local_usr = double('local_usr', :id => "1")
                User.stub(:find_by).and_return local_usr
                post :validate, :user => @user_params
                expect(response).to redirect_to(user_path(:id => "1"))
            end
        end
        

        context "when the invalid parameters are provided" do
            it "does not find the user in database" do
                expect(User).to receive(:find_by).with(:email => "", :password_hash => "146347")
                post :validate, :user => @sad_params
                #expect(response).to redirect_to(user_path)
            end
            it "redirects to the login page" do
                local_usr = nil
                User.stub(:find_by).and_return  local_usr
                post :validate, :user => @sad_params
                expect(response).to redirect_to(user_login_path)
            end


        end

    end

end

    
require 'rails_helper'

RSpec.describe ControlPanelController, type: :controller do
    describe "GET #index without authorization" do
    	it "should redirect to log_in page" do
    		user = create(:user)
    		get :index
    		expect(response).to redirect_to new_user_session_path 
    	end
    end

    describe "GET #index with authorization but without admin role" do
        it "should redirect to log_in page" do
            user = create(:user)
            sign_in user
            get :index
            expect(response).to redirect_to new_user_session_path 
        end
    end

  describe "GET #index with authorization and admin role of user" do
    before :each do
    	user = create(:user)
        user.add_role :admin
    	sign_in user
    end
    it "shouldn't redirect to log_in page" do
			user = create(:user)
			get :index
			expect(response).to render_template :index 
		end
    it "should populates an array of all users" do
    	user0 = User.take
    	user0.last_name = 'Кукин'
    	user0.save
    	user1 = create(:user, last_name: 'Петров')
    	user2 = create(:user, last_name: 'Абрамов')
    	user3 = create(:user, last_name: 'Сидоров')
    	get :index
    	expect(assigns(:users)).to match_array([user0, user1, user2, user3])
    end
    it "should renders the :index template" do
    	get :index
    	expect(response).to render_template("index")
    end
  end

  describe "GET #profyle without authorization" do
        it "should redirect to log_in page" do
            user = create(:user)
            get :profile, :id => user.id.to_s
            expect(response).to redirect_to new_user_session_path 
        end
    end

    describe "GET #profyle with authorization but without admin role" do
        it "should redirect to log_in page" do
            user = create(:user)
            sign_in user
            get :profile, :id => user.id.to_s
            expect(response).to redirect_to new_user_session_path 
        end
    end

  describe "GET #profyle with authorization and admin role" do
    before :each do
        user = create(:user)
        user.add_role :admin
        sign_in user
    end
    it "shouldn't redirect to log_in page" do
            user = create(:user)
            get :profile, :id => user.id.to_s
            expect(response).to_not redirect_to new_user_session_path 
    end
    it "should populates only one user" do
        user0 = User.take
        user0.last_name = 'Кукин'
        user0.save
        user1 = create(:user, last_name: 'Петров')
        user2 = create(:user, last_name: 'Абрамов')
        user3 = create(:user, last_name: 'Сидоров')
        get :profile, :id => user2.id.to_s
        expect(assigns(:user)).to eq(user2)
    end
    it "should renders the :profyle template" do
        user2 = create(:user, last_name: 'Абрамов')
        get :profile, :id => user2.id.to_s
        expect(response).to render_template("profile")
    end
  end

  describe "GET #schedule without authorization and admin role" do
    it "should redirect to log_in page" do
        user = build(:user)
        get :schedule, :grade_id => '1', :date => Date.today.to_s
        expect(response).to redirect_to new_user_session_path
    end
  end
  describe "GET #schedule with authorization and without admin role" do
    it "should redirect to log_in page" do
        user = create(:user)
        sign_in user
        get :schedule, :grade_id => '1', :date => Date.today.to_s
        expect(response).to redirect_to new_user_session_path
    end
  end
  describe "GET #schedule with authorization and admin role" do
    it "shouldn't redirect to log_in page" do
        user = create(:user)
        user.add_role :admin
        sign_in user
        grade = create(:grade)
        get :schedule , :grade_id => grade.id, :date => Date.today.to_s
        expect(response).to render_template :schedule
    end
  end
 
end

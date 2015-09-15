require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
	describe "GET #index" do
		it "should redirect to login page without authorization" do
			user = create(:user)
			get :index
			expect(response).to redirect_to new_user_session_path
		end
		it "should refirect to login page with authorization and without admin role" do
			user = create(:user)
			sign_in user
			get :index
			expect(response).to redirect_to new_user_session_path
		end
		it "should render index template" do
			user = create(:user)
			user.add_role :admin
			sign_in user
			discipline = create(:discipline)
			discipline2 = create(:discipline)
			get :index
			expect(response).to render_template :index
		end 
	end

	describe "GET #new" do
		it "should redirect to login page without authorization" do
			user = create(:user)
			get :new
			expect(response).to redirect_to new_user_session_path
		end
		it "should refirect to login page with authorization and without admin role" do
			user = create(:user)
			sign_in user
			get :new
			expect(response).to redirect_to new_user_session_path
		end
		it "should render new template" do
			user = create(:user)
			user.add_role :admin
			sign_in user
			get :new
			expect(response).to render_template :new
		end 
	end

	describe "POST #create" do
		it "should redirect to login page without authorization" do
			user = create(:user)
			post :create, :user => user.attributes
			expect(response).to redirect_to new_user_session_path
		end
		it "should refirect to login page with authorization and without admin role" do
			user = create(:user)
			sign_in user
			post :create, :user => user.attributes
			expect(response).to redirect_to new_user_session_path
		end
		it "should add record to disciplines" do
			user = create(:user)
			user.add_role :admin
			sign_in user
			discipline = build(:discipline)
			post :create, :discipline => discipline.attributes
			expect(Discipline.all.count).to eq(1)
		end 
	end
end

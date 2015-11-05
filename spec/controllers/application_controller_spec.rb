require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "Filters for permission checking" do
    controller do
      before_action :force_authentication
      before_action :has_to_be_admin, only: [:admin_restricted_page]

      def user_restricted_page
        render text: "Access Granted"
      end

      def admin_restricted_page
        render text: "Access Granted"
      end

    end

    before(:example) do
      routes.draw do
        %w(user admin).each do |permission|
          get "#{permission}_restricted_page" => "anonymous##{permission}_restricted_page"
        end
      end
    end

    describe "force_authentication" do
      it "redirects to login page if not logged in" do
        get :user_restricted_page

        expect( response ).to redirect_to(sessions_new_path)
      end

      it "destroys expired sessions" do
        user = create(:user)
        user.rank = User::ACCEPTED
        user.save!
        get :user_restricted_page, nil, { auth: {user_id: user.id, login_time: 1.year.ago} }        

        expect( session.to_hash ).not_to have_key('auth')
      end

      it "extends validation of non expired sessions" do
        user = create(:user)
        user.rank = User::ACCEPTED
        user.save!
        get :user_restricted_page, nil, { auth: {user_id: user.id, login_time: 10.minutes.ago} }

        expect( session[:auth][:login_time] ).to_be >= 5.minutes.ago
      end

      it "should set @current_user to the current user" do
        user = create(:user)
        user.rank = User::ACCEPTED
        user.save!
        get :user_restricted_page, nil, { auth: {user_id: user.id, login_time: Time.now()} }

        expect( assigns(:current_user) ).not_to be_nil
      end
    end

    describe "has_to_be_admin" do
      it "redirects non admin users to root" do
        user = create(:user)
        user.rank = User::ACCEPTED
        user.save!
        get :admin_restricted_page, nil, { auth: {user_id: user.id, login_time: Time.now()} }

        expect( response ).to redirect_to(root_path)
        expect( flash[:errors] ).not_to be_empty
      end

      it "allows admin users to admin around" do
        user = create(:user)
        user.rank = User::ADMIN
        user.save!
        get :admin_restricted_page, nil, { auth: {user_id: user.id, login_time: Time.now()} }

        expect( response ).to have_http_status(:success)
        expect( flash.to_hash ).not_to have_key('errors')
      end

      it "allows root user to admin around" do
        user = create(:user)
        user.rank = User::SUPER
        user.save!
        get :admin_restricted_page, nil, { auth: {user_id: user.id, login_time: Time.now()} }

        expect( response ).to have_http_status(:success)
        expect( flash.to_hash ).not_to have_key('errors')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "Filters for permission checking" do
    controller do
      before_action :force_authentication
      #before_action :has_to_be_admin, only: [:admin_restricted_page]

      def user_restricted_page
        p 'yuhul'
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
       from =  
      end

      it "extends validation of non expired sessions" do
        pending 'test writing'
      end

      it "should set @current_user to the current user" do
        pending 'test writing'
      end
    end

    describe "has_to_be_admin" do
      it "redirects non admin users to root" do
        pending 'test writing'
      end

      it "allows admin users to admin around" do
        pending 'test writing'
      end

      it "allows root user to admin around" do
        pending 'test writing'
      end
    end
  end
end

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "force_authentication" do
    it "redirects to login page if not logged in" do
      pending "needs review"
      get '/users'
      expect( response ).to redirect_to('/sessions/new')
    end

    it "destroys expired sessions" do
      pending 'test writing'
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

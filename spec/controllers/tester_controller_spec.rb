require "rails_helper"

RSpec.describe ApplicationController, :type => :controller do
  controller do
    before_action :force_authentication

    def index
      p 'vai curintia'
    end
  end

  describe "handling AccessDenied exceptions" do
    it "redirects to the /401.html page" do
      get :index
    end
  end
end

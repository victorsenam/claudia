require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    # TODO: Pass this test :) (It's not assigning the flash correctly)
    it "should assign errors from last request on errors", :pending do
      errors = ['testes de erros']
      flash['errors'] = errors
      get :new
      expect(assigns(:errors)).to eq( errors )
    end
    
    it "should assign an empty array to errors on absence of errors" do
      get :new
      
      expect(assigns(:errors)).to eq( [] )
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end

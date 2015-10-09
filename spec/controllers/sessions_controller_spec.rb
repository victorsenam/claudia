require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should assign errors from last request on errors" do
      errors = ['testes de erros']
      get :new, nil, nil, errors: errors
      expect(assigns(:errors)).to eq( errors )
    end
    
    it "should assign an empty array to errors on absence of errors" do
      get :new
      
      expect(assigns(:errors)).to eq( [] )
    end

    dd
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end

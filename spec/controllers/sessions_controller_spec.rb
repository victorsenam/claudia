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

  end

  describe "POST #create" do
# TODO: Test all creation features, pending users, valid users, unexistant users, mail fails, etc...
    it "should assign a session to a valid active user" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
      user.rank = user_attr[:rank] = 1


      post :create, {email: user_attr[:email], password: user_attr[:password]}

      expect( session ).not_to be_empty
    end
  end

  describe "GET #destroy" do
    it "destroy all session variables" do
      get :destroy, nil, {param: 'content'}
      expect( session ).to be_empty
    end

    it "sets a success notice" do
      get :destroy, nil, {param: 'content'}
      expect( flash ).not_to be_empty
    end
  end

end

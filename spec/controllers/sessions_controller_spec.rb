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
    it "should log in a valid active user" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
      user.rank = user_attr[:rank] = User::ACCEPTED
      user.save!

      post :create, {email: user_attr[:email], password: user_attr[:password]}

      expect( session[:auth]['login_time'] ).to be >= (30.minutes.ago)
      expect( session[:auth]['user_id'] ).to equal(user.id)
      expect( flash[:notice] ).not_to be_empty
      expect( flash.to_hash ).not_to have_key('errors')
    end

    it "should not login pending users" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr) # By default, it's a pending user
    
      post :create, {email: user_attr[:email], password: user_attr[:password]}

      expect( session.to_hash ).not_to have_key('auth')
      expect( flash.to_hash ).not_to have_key('notice')
      expect( flash[:errors] ).not_to be_empty
    end

    it "should not login unexistant users" do
      user_attr = attributes_for(:user)

      post :create, {email: user_attr[:email], password: user_attr[:password]}

      expect( session.to_hash ).not_to have_key('auth')
      expect( flash.to_hash ).not_to have_key('notice')
      expect( flash[:errors] ).not_to be_empty
    end

    it "should not login users with a wrong password" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
      
      post :create, {email: user_attr[:email], password: (user_attr[:password]+'suffix')}

      expect( session.to_hash ).not_to have_key('auth')
      expect( flash.to_hash ).not_to have_key('notice')
      expect( flash[:errors] ).not_to be_empty
    end
  end

  describe "GET #destroy" do
    it "destroy all session variables" do
      get :destroy, nil, { user_id: 9 } # arbritary user id
      expect( session.to_hash ).not_to have_key('auth')
    end

    it "sets a success notice" do
      get :destroy, nil, {param: 'content'}
      expect( flash[:notice] ).not_to be_empty
    end
  end
end

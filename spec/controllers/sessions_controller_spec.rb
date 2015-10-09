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

      p flash.to_hash
      expect( session ).not_to be_empty
      expect( session.to_hash ).to have_key('user_id')
      expect( flash.to_hash ).to have_key('notice')
      expect( flash[:notice] ).not_to be_empty
      expect( flash.to_hash ).not_to have_key('errors')
    end

    it "should not login pending users" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
    
      post :create, {email: user_attr[:email], password: user_attr[:password]}

      expect( session.to_hash ).not_to have_key('user_id')
      expect( flash.to_hash ).not_to have_key('notice')
      expect( flash.to_hash ).to have_key('errors')
      expect( flash[:errors] ).not_to be_empty
    end

    it "should not login unexistant users" do
      user_attr = attributes_for(:user)

      post :create, {email: user_attr[:email], password: user_attr[:password]}

      expect( session.to_hash ).not_to have_key('user_id')
      expect( flash.to_hash ).not_to have_key('notice')
      expect( flash.to_hash ).to have_key('errors')
      expect( flash[:errors] ).not_to be_empty
    end

    it "should not login users with a wrong password" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
      
      post :create, {email: user_attr[:email], password: (user_attr[:password]+'suffix')}

      expect( session.to_hash ).not_to have_key('user_id')
      expect( flash.to_hash ).not_to have_key('notice')
      expect( flash.to_hash ).to have_key('errors')
      expect( flash[:errors] ).not_to be_empty
    end
  end

  describe "GET #destroy" do
    it "destroy all session variables" do
      get :destroy, nil, { user_id: 9 } # arbritary user id
      expect( session.to_hash ).not_to have_key('user_id')
    end

    it "sets a success notice" do
      get :destroy, nil, {param: 'content'}
      expect( flash ).not_to be_empty
      expect( flash.to_hash ).to have_key('notice')
    end
  end

end

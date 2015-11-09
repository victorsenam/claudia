  require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:user)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:user, email: 'notanemail')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { { auth: { login_time: Time.now(), user_id: valid_attributes[:id] }.stringify_keys  } }

  describe "GET #index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      user.rank = User::ADMIN
      user.save!

      get :index, {}, valid_session

      expect(assigns(:users)).to eq([user])
    end

    it "blocks non-admins" do
     user = create(:user, valid_attributes)
     user.rank = User::ACCEPTED
     user.save!

     get :index, {}, valid_session

     expect( response ).to redirect_to(root_path)
    end
  end

  describe "POST #update_ranks" do
    users = []
    rank_change = {}

    before(:example) do
      # creating the test users
      3.times do |i|
        users[i] = create(:user)
      end

      # creating the admin
      users[3] = create(:user, valid_attributes)
      users[3].rank = User::ADMIN
      users[3].save!

      rank_change = {}
      users.each do |user|
        rank_change[user.id] = user.rank
      end
    end

    it "redirects to index on get" do
      post :update_ranks, { rank: rank_change }, valid_session
      
      expect( response ).to redirect_to( users_path )
    end

    it "updates users ranks as posted" do
      rank_change[users[2].id] = User::ACCEPTED
      post :update_ranks, { rank: rank_change }, valid_session

      expect( User.find(users[2].id).rank ).to eq( User::ACCEPTED )
    end

    it "blocks non-admins" do
      users[3].rank = User::ACCEPTED
      users[3].save!

      post :update_ranks, { rank: rank_change }, valid_session

      expect( response ).to redirect_to( root_path )
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      user.rank = User::ACCEPTED
      user.save!
      get :show, {id: valid_attributes[:id]}, valid_session

      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    it "sets id if it's unsetted" do
      user = create(:user, valid_attributes)
      user.rank = User::ACCEPTED
      user.save!

      get :edit, nil, valid_session
      expect(assigns(:user)).to eq(user)
    end

    it "renders the 'edit' template" do
      user = create(:user, valid_attributes)
      user.rank = User::ACCEPTED
      user.save!

      get :edit, {id: valid_attributes[:id]}, valid_session
      expect( response ).to render_template( 'edit' )
    end

    it "assigns the current user as @user" do
      user = create(:user, valid_attributes)
      user.rank = User::ACCEPTED
      user.save!

      get :edit, {id: valid_attributes[:id]}, valid_session
      expect( assigns(:user) ).to eq(user)
    end

    it "doesn't allow non-admins to change other users" do
      user = create(:user, valid_attributes)
      user.rank = User::ACCEPTED
      user.save!

      get :edit, {id: valid_attributes[:id] + 1}, valid_session
      expect( response ).to redirect_to( root_path )
    end

    it "allows admins to edit anyone" do
      user = create(:user, valid_attributes)
      user.rank = User::ADMIN
      user.save!

      other = create(:user)

      get :edit, {id: other.id}, valid_session
      expect( response ).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the login page" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(sessions_new_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end

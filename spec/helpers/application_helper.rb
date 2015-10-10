require "spec_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "authentication_check" do
    it "current_user should be nil if nobody logged in" do
      expect( current_user ).to_be nil
    end

    it "current_user returns the logged user if logged in" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
      user.rank = user_attr[:rank] = User::ACCEPTED
      user.save!

      post 'sessions/create', {email: user_attr[:email], password: user_attr[:password]}

      expect( current_user ).to_be user[:id]
    end

    it "current_user should return nil after logout" do
      user_attr = attributes_for(:user)
      user = create(:user, user_attr)
      user.rank = user_attr[:rank] = User::ACCEPTED
      user.save!

      post 'sessions/create', {email: user_attr[:email], password: user_attr[:password]}
      get  'sessions/destroy'

      expect( current_user ).to_be nil
    end

    # TODO Find a better description for the below test
    it "updates the session date if the session has a valid date (for session keeping)", :pending # I mean, if it didn't expire yet
    it "kills the current session if it has already expired", :pending
  end
end

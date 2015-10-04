require 'rails_helper'
require 'faker'

describe User do
  context "on creation" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should have_secure_password }

    it "defaults user type to 0" do
      user = create(:user, type: nil)
      expect(user.type).to be_equal(0)
    end

    it "forces user types to 0" do
      user = create(:user, type: 7)
      expect(user.type).to be_equal(0)
    end

    it "rejects invalid emails" do
      expect(build(:user, email: 'enoistiozao')).not_to be_valid
      expect(build(:user, email: Faker::Internet.url)).not_to be_valid
    end

    it "rejects duplicate email" do
      create(:user, email: 'john.doe@example.com')
      user = build(:user, email: 'john.doe@example.com')

      expect(user).not_to be_valid
    end
  end

  context "updates" do
    it "accepts changes in user types" do
      user = build(:user)
      user.type = 7
      expect(user.type).to be_equal(7)
      user.type = 0
      expect(user.type).to be_equal(0)
    end

  end
end

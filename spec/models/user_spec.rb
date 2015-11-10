require 'rails_helper'
require 'faker'

describe User do
  context "on creation" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    it { should validate_presence_of(:name).with_message(" vazio!") }
    it { should validate_presence_of(:email).with_message("é um campo obrigatório.") }
    it { should validate_length_of(:password).is_at_least(6).with_message(" deve ter pelo menos 6 caracteres.") }
    it { should have_secure_password }

    it "defaults user type to 0" do
      user = create(:user, rank: nil)
      expect(user.rank).to be_equal(0)
    end

    it "forces user types to 0" do
      user = create(:user, rank: 7)
      expect(user.rank).to be_equal(0)
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
      user.rank = 7
      expect(user.rank).to be_equal(7)
      user.rank = 0
      expect(user.rank).to be_equal(0)
    end

  end
end

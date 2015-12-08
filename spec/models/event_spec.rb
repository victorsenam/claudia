require 'rails_helper'

describe User do
  context "on creation" do
    it "has a valid factory" do
      expect(build(:event)).to be_valid
    end

    it { should validate_presence_of(:name).with_message(" vazio!") }
  end
end

require 'rails_helper'

describe User do
  context "on creation" do
    it "has a valid factory" do
      expect(build(:event)).to be_valid
    end
  end
end

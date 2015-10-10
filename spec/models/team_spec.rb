require 'rails_helper'

describe Team, type: :model do
	context "on creation" do
		it "has a valid factory" do
      expect(build(:team)).to be_valid
    end

    it {should validate_presence_of(:name).with_message("Denomine a nova equipe.")}

    

	end
end

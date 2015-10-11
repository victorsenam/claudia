require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe "get logged user" do
    it "returns logged user if there is any" do
      pending "test writing"
    end

    it "returns nil if there's no login" do
      pending "test writing"
    end
  end
end

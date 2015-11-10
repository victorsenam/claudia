require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:example) do
    @users = assign(:users, [
      build(:user),
      build(:user)
    ])
  end

  it "renders a list of users" do
    render
    @users.each do |user|
      assert_select "tr>td", :text => user.name
      assert_select "tr>td", :text => user.email
    end
  end

  it "renders a form for a rank array with each user" do
    render
    assert_select "form[action=?][method=?]", users_rank_update_path, "post" do
      @users.each do |user|
        assert_select "select[name=?]", "rank[#{user.id}]"
        assert_select "select[name=?]>option", "rank[#{user.id}]"
      end
    end
  end
end

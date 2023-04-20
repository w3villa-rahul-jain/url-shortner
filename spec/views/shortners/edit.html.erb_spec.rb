require 'rails_helper'

RSpec.describe "shortners/edit", type: :view do
  before(:each) do
    @shortner = assign(:shortner, Shortner.create!(
      original_url: "MyString",
      short_url: "MyString",
      click_count: 1
    ))
  end

  it "renders the edit shortner form" do
    render

    assert_select "form[action=?][method=?]", shortner_path(@shortner), "post" do

      assert_select "input[name=?]", "shortner[original_url]"

      assert_select "input[name=?]", "shortner[short_url]"

      assert_select "input[name=?]", "shortner[click_count]"
    end
  end
end

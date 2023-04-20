require 'rails_helper'

RSpec.describe "shortners/new", type: :view do
  before(:each) do
    assign(:shortner, Shortner.new(
      original_url: "MyString",
      short_url: "MyString",
      click_count: 1
    ))
  end

  it "renders new shortner form" do
    render

    assert_select "form[action=?][method=?]", shortners_path, "post" do

      assert_select "input[name=?]", "shortner[original_url]"

      assert_select "input[name=?]", "shortner[short_url]"

      assert_select "input[name=?]", "shortner[click_count]"
    end
  end
end

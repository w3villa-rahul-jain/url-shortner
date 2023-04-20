require 'rails_helper'

RSpec.describe "shortners/index", type: :view do
  before(:each) do
    assign(:shortners, [
      Shortner.create!(
        original_url: "Original Url",
        short_url: "Short Url",
        click_count: 2
      ),
      Shortner.create!(
        original_url: "Original Url",
        short_url: "Short Url",
        click_count: 2
      )
    ])
  end

  it "renders a list of shortners" do
    render
    assert_select "tr>td", text: "Original Url".to_s, count: 2
    assert_select "tr>td", text: "Short Url".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end

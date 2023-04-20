require 'rails_helper'

RSpec.describe "shortners/show", type: :view do
  before(:each) do
    @shortner = assign(:shortner, Shortner.create!(
      original_url: "Original Url",
      short_url: "Short Url",
      click_count: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Original Url/)
    expect(rendered).to match(/Short Url/)
    expect(rendered).to match(/2/)
  end
end

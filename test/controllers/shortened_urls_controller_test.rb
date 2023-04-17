require "test_helper"

class ShortenedUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shortened_urls_create_url
    assert_response :success
  end

  test "should get show" do
    get shortened_urls_show_url
    assert_response :success
  end
end

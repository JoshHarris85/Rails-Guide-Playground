require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  def auth
    { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
  end

  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Hello, Rails!"
  end


  test "can create an article" do
    get "/articles/new", headers: auth
    assert_response :success

    post "/articles",
      headers: auth,
      params: { article: { title: "can create", body: "article successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Title:\n  can create"
  end
end

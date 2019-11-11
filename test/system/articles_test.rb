require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  def authorize
    username = 'dhh'
    password = 'secret'
    if page.driver.browser.respond_to?(:authorize)
      # When headless
      page.driver.browser.authorize(username, password)
    else
      # When javascript test
      visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/"
    end
  end

  test "visiting the index" do
    visit articles_path

    assert_selector "h1", text: "Articles"
  end

  test "creating an article" do
    visit root_path

    click_on "New Article"

    authorize

    click_on "New Article"

    fill_in "Title", with: "Creating article"
    fill_in "Text", with: "Created this article!"

    click_on "Create Article"

    assert_text "Add a comment"
  end
end

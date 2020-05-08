require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "RailsTwitterApp"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "RailsTwitterApp"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | RailsTwitterApp"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | RailsTwitterApp"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | RailsTwitterApp"
  end

end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post  :create, params: { :user => {:email => "Lorem", :password_digest => "Ipsum dolor sit."} }
    assert_response :success
  end

end

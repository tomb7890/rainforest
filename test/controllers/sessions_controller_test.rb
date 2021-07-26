require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, params: { id: 1 }
    assert_redirected_to products_path
  end

end

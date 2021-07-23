require 'test_helper'
class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    product = products(:one)
    get :show, params: { id: product.id  }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    product = products(:one)
    get :edit, params: { id: product.id }
    assert_response :success
  end

end

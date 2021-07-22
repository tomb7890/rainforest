require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    #                   product GET    /products/:id(.:format)         products#show
    product = products(:one)

    get product_path
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get edit_product_path(23)
    assert_response :success
  end

end

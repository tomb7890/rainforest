require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test "the show action" do
    product = products(:one)
    review = reviews(:two)
    get :show, params: { product_id: product.id, id: review.id    }
    assert_response :success
  end

  test "review creation" do
    user  = users(:john)
    product = products(:one)
    review = reviews(:two)
    review.user = user
    review.product = product
    product_id = product.id
    post :create, params: { product_id: product.id,
                            review:
                              {
                                comment: "This product is awesome",
                                product_id: product.id,
                                user_id: user.id
                              }
                          }

    assert_redirected_to new_session_path
  end

  test "review destruction" do
    product = products(:one)
    review = reviews(:two)
    get :destroy, params: { product_id: product.id, id: review.id   }
    assert_redirected_to new_session_path
  end
end

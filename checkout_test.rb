require "minitest/autorun"
require_relative "checkout"

class CheckoutTest < Minitest::Test

  def test_startup_of_register
    @co = Checkout.new
    assert_equal [], @co.basket
  end
  
end

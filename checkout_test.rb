require "minitest/autorun"
require_relative "checkout"

class CheckoutTest < Minitest::Test

  def test_startup_of_register
    @co = Checkout.new
    assert_equal [], @co.basket
  end

  def test_scanning_of_a_chai
    @co = Checkout.new
    @co.scan("CH1")
    assert_equal ["CH1"], @co.basket
  end

end

require "minitest/autorun"
require_relative "checkout"

class CheckoutTest < Minitest::Test

  def setup
    @co = Checkout.new
  end

  def test_startup_of_register
    assert_equal [], @co.basket
  end

  def test_scanning_of_a_chai
    @co.scan("CH1")
    assert_equal ["CH1"], @co.basket
  end

  def test_total_of_a_chai
    @co.scan("CH1")
    assert_equal 3.11, @co.total
  end
end

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

  # def test_supplied_test_1
  #   @co.scan("CH1", "AP1", "CF1", "MK1")
  #   assert_equal 20.34, @co.total
  # end

  # def test_supplied_test_2
  #   @co.scan("MK1", "AP1")
  #   assert_equal 10.75, @co.total
  # end

  # def test_supplied_test_3
  #   @co.scan("CF1", "CF1")
  #   assert_equal 11.23, @co.total
  # end

  # def test_supplied_test_4
  #   @co.scan("AP1", "AP1", "CH1", "AP1")
  #   assert_equal 16.61, @co.total
  # end
end

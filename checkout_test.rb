require "minitest/autorun"
require_relative "checkout"

class CheckoutTest < Minitest::Test

  def setup
    @co = Checkout.new
  end

  def test_startup_of_register
    assert_equal true, @co.basket.is_a?(Array)
    assert_equal [], @co.basket
  end

  def test_scanning_of_a_chai_or_two
    @co.scan("CH1")
    assert_equal ["CH1"], @co.basket
    @co.scan("CH1")
    assert_equal ["CH1", "CH1"], @co.basket

  end

  def test_total_of_a_chai_or_two
    @co.scan("CH1")
    assert_equal 3.11, @co.total
    @co.scan("CH1")
    assert_equal 6.22, @co.total
  end

  def test_special_BOGO_coffee_bogo
    @co.scan("CF1")
    assert_equal 11.23, @co.total
    @co.scan("CF1")
    assert_equal 11.23, @co.total
    @co.scan("CF1")
    assert_equal 22.46, @co.total
    @co.scan("CF1")
    assert_equal 22.46, @co.total
  end

  def test_special_APPL_apple_price_drop
    @co.scan("AP1")
    assert_equal 6.00, @co.total
    @co.scan("AP1")
    assert_equal 12.00, @co.total
    @co.scan("AP1")
    assert_equal 13.50, @co.total
    @co.scan("AP1")
    assert_equal 18.00, @co.total
  end

  def test_special_CHMK_chai_milk_free
    @co.scan("CH1")
    @co.scan("MK1")
    assert_equal 3.11, @co.total
    @co.scan("MK1")
    @co.scan("CH1")
    assert_equal 10.97, @co.total
  end

  def test_supplied_test_1
    @co.scan("CH1")
    @co.scan("AP1")
    @co.scan("CF1")
    @co.scan("MK1")
    assert_equal 20.34, @co.total
  end

  def test_supplied_test_2
    @co.scan("MK1")
    @co.scan("AP1")
    assert_equal 10.75, @co.total
  end

  def test_supplied_test_3
    @co.scan("CF1")
    @co.scan("CF1")
    assert_equal 11.23, @co.total
  end

  def test_supplied_test_4
    @co.scan("AP1")
    @co.scan("AP1")
    @co.scan("CH1")
    @co.scan("AP1")
    assert_equal 16.61, @co.total
  end
end

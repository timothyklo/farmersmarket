class Checkout
  attr_accessor :basket
  @@prices = Hash["CH1" => 3.11, "AP1" => 6.00, "CF1" => 11.23, "MK1" => 4.75]

  def initialize
    self.basket = []
  end

  def scan(item)
    @basket.push(item)
  end

  def total
    @total = 0
    @basket.each {|x| @total += @@prices[x]}
    @total
  end

end

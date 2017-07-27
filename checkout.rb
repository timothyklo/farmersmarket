class Checkout
  attr_accessor :basket

  def initialize
    self.basket = []
  end

  def scan(item)
    @basket.push(item)
  end

end

class Checkout
  attr_accessor :basket

  # REGULAR PRICES:
  @@prices = Hash["CH1" => 3.11, "AP1" => 6.00, "CF1" => 11.23, "MK1" => 4.75]

  # SPECIAL SALES:
  # BOGO -- Buy-One-Get-One-Free Special on Coffee. (Unlimited)
  # APPL -- If you buy 3 or more bags of Apples, the price drops to $4.50.
  # CHMK -- Purchase a box of Chai and get milk free. (Limit 1)
  @@sales = Hash["BOGO" => -11.23, "APPL" => -1.50, "CHMK" => -4.75]

  # adds sales to prices hash
  @@sales.each do |item, discount|
    @@prices[item] = discount
  end


  def initialize
    self.basket = []
  end

  def scan(*item)
    item.each{|item| @basket.push(item)}
  end

  def total
    @total = 0
    @basket.each {|x| @total += @@prices[x]}
    @total
  end

end

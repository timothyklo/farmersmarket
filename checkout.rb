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
    self.basket = Array.new
  end

  def scan(item)
    @basket.push(item)
    # BOGO -- Buy-One-Get-One-Free Special on Coffee. (Unlimited)
    if item == "CF1"
      if (@basket.count { |carted| carted == "CF1"}) % 2 == 0
        @basket.push("BOGO")
      end
    end

    # APPL -- If you buy 3 or more bags of Apples, the price drops to $4.50.

    # CHMK -- Purchase a box of Chai and get milk free. (Limit 1)

  end

  def total
    @total = 0
    @basket.each {|x| @total += @@prices[x]}
    @total.round(2)
  end

end

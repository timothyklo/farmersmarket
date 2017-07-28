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
    case item

    when "CF1"
      @basket.push("CF1")
      # BOGO -- Buy-One-Get-One-Free Special on Coffee. (Unlimited)
      if @basket.count("CF1") % 2 == 0
        @basket.push("BOGO")
      end

    when "AP1"
      if @basket.count("AP1") < 2
        @basket.push("AP1")
        # APPL -- If you buy 3 or more bags of Apples, the price drops to $4.50.
      elsif @basket.count("AP1") == 2
        @basket.insert(@basket.index("AP1") + 1, "APPL")
        @basket.insert(@basket.rindex("AP1") + 1, "APPL")
        @basket.push("AP1")
        @basket.push("APPL")
      else
        @basket.push("AP1")
        @basket.push("APPL")
      end

    when "CH1", "MK1"
      @basket.push(item)
      # CHMK -- Purchase a box of Chai and get milk free. (Limit 1)
      if (@basket.count("CHMK") == 0) && (@basket.count("CH1") == 1) && (@basket.count("MK1") ==1)
        @basket.push("CHMK")
      end

    else
      puts "Item not found"
    end
  end

  def total
    @total = 0
    @basket.each {|x| @total += @@prices[x]}
    # print @basket, " = ", @total.round(2)
    # puts
    @total.round(2)
  end

end

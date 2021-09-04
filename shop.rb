class Shop
  attr_reader :sneakers

  DISCOUNT_STANDARD_VALUE = 5
  DISCOUNT_RATE = 0.1
  AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE

  def initialize(sneaker_params)
    @sneakers = []
    register_sneaker(sneaker_params)
  end

  def register_sneaker(sneaker_params)
    sneaker_params.each do |param|
      @sneakers <<Sneaker.new(param)
    end
  end

  def disp_sneakers
    puts "ナイキショップへようこそ！どのスニーカーを購入しますか？"
    @sneakers.each do |sneaker|
    puts "#{sneaker.id}.#{sneaker.name} (#{sneaker.price}円)"
    end
  end

  def ask_quantity(chosen_sneaker)
    puts "#{chosen_sneaker.name}ですね。何個買いますか？"
  end

  def calculate_charges(user)
    total_price = user.chosen_sneaker.price * user.quantity_of_sneaker
    if user.quantity_of_sneaker >= DISCOUNT_STANDARD_VALUE
      puts "#{DISCOUNT_STANDARD_VALUE}個以上なので#{(DISCOUNT_RATE*100).floor}％割引となります！"
      total_price *= AFTER_DISCOUNT_RATE
    end
    puts "合計金額は#{total_price.floor}円です。"
    puts "お買い上げありがとうございました！"
  end
end

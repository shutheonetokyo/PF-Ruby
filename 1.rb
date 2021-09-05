class Sneaker
  attr_reader :id, :name, :price

  @@count = 0

  def initialize(sneaker_params)
    @id = @@count += 1
    @name = sneaker_params[:name]
    @price = sneaker_params[:price]
  end
end

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

class User
  attr_reader :chosen_sneaker, :quantity_of_sneaker

  def choose_sneaker(sneakers)
    while true
      print "商品の番号を選択 > "
      select_sneaker_id = gets.to_i
      @chosen_sneaker = sneakers.find{|sneaker| sneaker.id == select_sneaker_id}
      break if !@chosen_sneaker.nil?
      puts "#{sneakers.first.id}から#{sneakers.last.id}の番号から選んでください。"
    end
  end

  def decide_quantity
    while true
      print "個数を入力 >"
      @quantity_of_sneaker = gets.to_i
      break if @quantity_of_sneaker >= 1
      puts "一個以上選択してください。"
    end
  end
end


sneaker_params1 = [
  { name: "Dunk" , price: 15000 },
  { name: "Air Max1" , price: 15000 },
  { name: "Air Jordan1" , price: 150000 },
  { name: "Air Force1" , price: 15000 },
  { name: "Air Blazer" , price: 15000 }
]

shop1 = Shop.new(sneaker_params1)

adding_sneaker_params1 = [
  { name: "Air Max95" , price: 15000 },
  { name: "Air Max98 " , price: 15000 }
]

shop1.register_sneaker(adding_sneaker_params1)

user = User.new

shop1.disp_sneakers
user.choose_sneaker(shop1.sneakers)
shop1.ask_quantity(user.chosen_sneaker)
user.decide_quantity
shop1.calculate_charges(user)

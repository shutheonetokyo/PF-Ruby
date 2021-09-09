class Sneaker
  attr_reader :id, :name, :price

  @@count = 0

  def initialize(sneaker_params)
    @id = @@count += 1
    @name = sneaker_params[:name]
    @price = sneaker_params[:price]
  end
end

class SneakerColor
  attr_reader :id, :name

  @@count = 0

  def initialize(sneaker_colors)
    @id = @@count += 1
    @name = sneaker_colors[:name]
  end
end

class Shop
  attr_reader :sneakers, :colors

  DISCOUNT_STANDARD_VALUE = 5
  DISCOUNT_RATE = 0.1
  AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE

  def initialize(sneaker_params, sneaker_colors)
    @sneakers = []
    register_sneaker(sneaker_params)
    @colors = []
    register_color(sneaker_colors)
  end

  # 商品を登録
  def register_sneaker(sneaker_params)
    sneaker_params.each do |param|
      @sneakers << Sneaker.new(param)
    end
  end

  # 商品の色を選択
  def register_color(sneaker_colors)
    sneaker_colors.each do |color|
      @colors << SneakerColor.new(color)
    end
  end

  # 商品の表示
  def disp_sneakers
    puts "ナイキショップへようこそ！どのスニーカーを購入しますか？"
    @sneakers.each do |sneaker|
    puts "#{sneaker.id}.#{sneaker.name} (#{sneaker.price}円)"
    end
  end

  # 色の表示
  def ask_color(chosen_sneaker)
    puts "#{chosen_sneaker.name}ですね！色は何にしますか？"
    @colors.each do |color|
      puts "#{color.id}.#{color.name}"
    end
  end

  # 個数を質問
  def ask_quantity(chosen_sneaker)
    puts "#{chosen_sneaker.name}ですね。何個買いますか？"
  end

  # 合計金額を計算
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

  # 商品を選択
  def choose_sneaker(sneakers)
    while true
      print "商品の番号を選択 > "
      select_sneaker_id = gets.to_i
      @chosen_sneaker = sneakers.find{|sneaker| sneaker.id == select_sneaker_id}
      break if !@chosen_sneaker.nil?
      puts "#{sneakers.first.id}から#{sneakers.last.id}の番号から選んでください。"
    end
  end


  # 色を選択
  def choose_color(snaker_colors)
    
  end


  # 個数を決定
  def decide_quantity
    while true
      print "個数を入力 >"
      @quantity_of_sneaker = gets.to_i
      break if @quantity_of_sneaker >= 1
      puts "一個以上選択してください。"
    end
  end
end

# 商品データ
sneaker_params1 = [
  { name: "Dunk" , price: 15000 },
  { name: "Air Max1" , price: 15000 },
  { name: "Air Jordan1" , price: 150000 },
  { name: "Air Force1" , price: 15000 },
  { name: "Air Blazer" , price: 15000 }
]

sneaker_colors = [
  { name: "black" },
  { name: "white" },
  { name: "green" },
  { name: "red" },
  { name: "blue" }
]

# product_params1 の商品を持つお店の開店
shop1 = Shop.new(sneaker_params1, sneaker_colors)


# 追加商品データ
adding_sneaker_params1 = [
  { name: "Air Max95" , price: 15000 },
  { name: "Air Max98 " , price: 15000 }
]

# 商品を登録(adding_sneaker_params1の追加)
shop1.register_sneaker(adding_sneaker_params1)

# 商品の色を登録(sneaker_colorsの追加)
shop1.register_color(sneaker_colors)

# お客さんの来店
user = User.new

# 商品の表示
shop1.disp_sneakers

# 商品の選択
user.choose_sneaker(shop1.sneakers)

# 色の表示
shop1.ask_color(user.chosen_sneaker)

# 色の選択
user.choose_color

# 個数を選択
shop1.ask_quantity(user.chosen_sneaker)

# 個数を決定
user.decide_quantity

# 合計金額を計算(実印数をuserというインスタンスに設定)
shop1.calculate_charges(user)

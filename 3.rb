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
class SneakerSize
  attr_reader :id, :name

  @@count = 0

  def initialize(sneaker_sizes)
    @id = @@count += 1
    @size = sneaker_sizes[:name]
  end
end
class Shop
  attr_reader :sneakers, :colors, :sizes

  def initialize(sneaker_params, sneaker_colors, sneaker_sizes)
    @sneakers = []
    register_sneaker(sneaker_params)
    @colors = []
    register_color(sneaker_colors)
    @sizes = []
    register_size(sneaker_sizes)
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

  # 商品のサイズを選択
  def register_size(sneaker_sizes)
    sneaker_sizes.each do |size|
      @sizes << SneakerSize.new(size)
    end
  end

  # 商品の表示
  def disp_sneakers
    puts "ナイキショップへようこそ！どのスニーカーを購入しますか？"
    @sneakers.each do |sneaker|
    puts "#{sneaker.id}.#{sneaker.name} (#{sneaker.price}円)"
    end
  end

  # 商品の色の表示
  def ask_color(chosen_sneaker)
    puts "#{chosen_sneaker.name}ですね！色は何にしますか？"
    @colors.each do |color|
      puts "#{color.id}.#{color.name}"
    end
  end

  # 商品のサイズの表示
  def ask_size(chosen_sneaker, chosen_sneaker_color)
    puts "#{chosen_sneaker.name}で、色は#{chosen_sneaker_color.name}ですね！足のサイズは何にしますか？"
    @sizes.each do |size|
      puts "#{size.id}.#{size.name}"
    end
  end

end

class User
  attr_reader :chosen_sneaker, :chosen_sneaker_color, :chosen_sneaker_size, :quantity_of_sneaker

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

  # 商品の色を選択
  def choose_color(colors)
    while true
      print "商品の番号を選択 > "
      select_color_id = gets.to_i
      @chosen_sneaker_color = colors.find{|color| color.id == select_color_id}
      break if !@chosen_sneaker_color.nil?
      puts "#{colors.first.id}から#{colors.last.id}の番号から選んでください。"
    end
  end

  # 商品のサイズを選択
  def choose_size(sizes)
    while true
      print "商品の番号を選択 > "
      select_size_id = gets.to_i
      @chosen_sneaker_size = sizes.find{|size| size.id == select_size_id}
      break if !@chosen_sneaker_size.nil?
      puts "#{sizes.first.id}から#{sizes.last.id}の番号から選んでください。"
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

sneaker_sizes = [
  { name: "25.0cm" },
  { name: "25.5cm" },
  { name: "26.0cm" },
  { name: "26.5cm" },
  { name: "27.0cm" },
  { name: "27.5cm" },
  { name: "28.0cm" },
  { name: "28.5cm" },
  { name: "29.0cm" },
  { name: "29.5cm" }
]

# product_params1 の商品を持つお店の開店
shop1 = Shop.new(sneaker_params1, sneaker_colors, sneaker_sizes)


# 追加商品データ
adding_sneaker_params1 = [
  { name: "Air Max95" , price: 15000 },
  { name: "Air Max98 " , price: 15000 }
]

# 商品を登録(adding_sneaker_params1の追加)
shop1.register_sneaker(adding_sneaker_params1)

# 商品の色を登録(sneaker_colorsの追加)
shop1.register_color(sneaker_colors)

# 商品のサイズを登録(sneaker_sizesの追加)
shop1.register_size(sneaker_sizes)

# お客さんの来店
user = User.new

# 商品の表示
shop1.disp_sneakers

# 商品の選択
user.choose_sneaker(shop1.sneakers)

# 商品の色の表示
shop1.ask_color(user.chosen_sneaker)

# 商品の色の選択
user.choose_color(shop1.colors)

#商品のサイズの表示
shop1.ask_size(user.choose_sneaker, user.chosen_sneaker_color)

#商品のサイズの選択
user.choose_size(shop1.sizes)


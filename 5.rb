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
    @name = sneaker_sizes[:name]
  end
end

class SneakerDecision
  attr_reader :id, :name

  @@count = 0

  def initialize(sneaker_decisions)
    @id = @@count += 1
    @name = sneaker_decisions[:name]
  end
end



class AddingSneaker
  attr_reader :id, :name, :price

  @@count = 0

  def initialize(adding_sneaker_params)
    @id = @@count += 1
    @name = adding_sneaker_params[:name]
    @price = adding_sneaker_params[:price]
  end
end
class AddingSneakerColor
  attr_reader :id, :name

  @@count = 0

  def initialize(adding_sneaker_colors)
    @id = @@count += 1
    @name = adding_sneaker_colors[:name]
  end
end
class AddingSneakerSize
  attr_reader :id, :name

  @@count = 0

  def initialize(adding_sneaker_sizes)
    @id = @@count += 1
    @name = adding_sneaker_sizes[:name]
  end
end

class AddingSneakerDecision
  attr_reader :id, :name

  @@count = 0

  def initialize(adding_sneaker_decisions)
    @id = @@count += 1
    @name = adding_sneaker_decisions[:name]
  end
end
class Shop
  attr_reader :sneakers, :colors, :sizes, :decisions, :adding_sneakers, :adding_colors, :adding_sizes

  def initialize(sneaker_params, sneaker_colors, sneaker_sizes, sneaker_decisions, adding_sneaker_params, adding_sneaker_colors, adding_sneaker_sizes)
    @sneakers = []
    register_sneaker(sneaker_params)
    @colors = []
    register_color(sneaker_colors)
    @sizes = []
    register_size(sneaker_sizes)
    @decisions = []
    register_decision(sneaker_decisions)
    @adding_sneakers = []
    register_adding_sneaker(adding_sneaker_params)
    @adding_colors = []
    register_adding_color(adding_sneaker_colors)
    @adding_sizes = []
    register_adding_size(adding_sneaker_sizes)
  end

  # 商品を登録
  def register_sneaker(sneaker_params)
    sneaker_params.each do |param|
      @sneakers << Sneaker.new(param)
    end
  end

  # 商品の色の登録
  def register_color(sneaker_colors)
    sneaker_colors.each do |color|
      @colors << SneakerColor.new(color)
    end
  end

  # 商品のサイズの登録
  def register_size(sneaker_sizes)
    sneaker_sizes.each do |size|
      @sizes << SneakerSize.new(size)
    end
  end

  # "はい"か"いいえ"の登録
  def register_decision(sneaker_decisions)
    sneaker_decisions.each do |decision|
      @decisions << SneakerDecision.new(decision)
    end
  end



  # ２つ目の商品を登録
  def register_adding_sneaker(adding_sneaker_params)
    adding_sneaker_params.each do |adding_sneaker_param|
      @adding_sneakers << AddingSneaker.new(adding_sneaker_param)
    end
  end

  # ２つ目の商品の色の登録
  def register_adding_color(adding_sneaker_colors)
    adding_sneaker_colors.each do |adding_sneaker_color|
      @adding_colors << AddingSneakerColor.new(adding_sneaker_color)
    end
  end

  # ２つ目の商品のサイズの登録
  def register_adding_size(adding_sneaker_sizes)
    adding_sneaker_sizes.each do |adding_sneaker_size|
      @adding_sizes << AddingSneakerSize.new(adding_sneaker_size)
    end
  end


  # 商品の表示
  def ask_sneakers
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
  def ask_size(chosen_sneaker_color)
    puts "#{chosen_sneaker_color.name}ですね！足のサイズは何にしますか？"
    @sizes.each do |size|
      puts "#{size.id}.#{size.name}"
    end
  end

  # "はい"か"いいえ"の表示
  def ask_decision(chosen_sneaker_size)
    puts "#{chosen_sneaker_size.name}ですね。もう1足ご購入していただくと、2足目が10%オフになるキャンペーンを実施中です!2足目を購入されますか？"
    @decisions.each do |decision|
      puts "#{decision.id}.#{decision.name}"
    end
  end

  # "2足目の商品の選択 or お会計"の表示
  def ask_adding_sneaker(chosen_sneaker_decision)
    if chosen_sneaker_decision.id == 1
      puts "２足目をお選びください。"
      @adding_sneakers.each do |adding_sneaker|
        puts "#{adding_sneaker.id}.#{adding_sneaker.name} (#{adding_sneaker.price}円)"
      end
    elsif chosen_sneaker_decision.id == 2
      puts "ご購入ありがとうございました。"
    end
  end

  # 追加商品の色の表示
  def ask_adding_color(chosen_adding_sneaker)
    puts "#{chosen_adding_sneaker.name}ですね！色は何にしますか？"
    @adding_colors.each do |adding_color|
      puts "#{adding_color.id}.#{adding_color.name}"
    end
  end

  # 追加商品のサイズの表示
  def ask_adding_size(chosen_adding_sneaker_color)
    puts "#{chosen_adding_sneaker_color.name}ですね！足のサイズは何にしますか？"
    @adding_sizes.each do |adding_size|
      puts "#{adding_size.id}.#{adding_size.name}"
    end
  end

  def calculate_charges
    total_price = 
    puts "#{chosen_sneaker}と#{choose_adding_sneaker}の２足"

  end


end


class User
  attr_reader :chosen_sneaker, :chosen_sneaker_color, :chosen_sneaker_size, :chosen_sneaker_decision, :chosen_adding_sneaker, :chosen_adding_sneaker_color, :chosen_adding_sneaker_size

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

  # "はい"、"いいえ"を選択
  def choose_decision(decisions)
    while true
      print "番号を選択 > "
      select_decision_id = gets.to_i
      @chosen_sneaker_decision = decisions.find{|decision| decision.id == select_decision_id}
      break if !@chosen_sneaker_decision.nil?
      puts "#{decisions.first.id}または#{decisions.last.id}の番号から選んでください。"
    end
  end

  # 追加商品を選択
  def choose_adding_sneaker(adding_sneakers)
    while true
      print "商品の番号を選択 > "
      select_adding_sneaker_id = gets.to_i
      @chosen_adding_sneaker = adding_sneakers.find{|adding_sneaker| adding_sneaker.id == select_adding_sneaker_id}
      break if !@chosen_adding_sneaker.nil?
      puts "#{adding_sneakers.first.id}から#{adding_sneakers.last.id}の番号から選んでください。"
    end
  end

  # 追加商品の色を選択
  def choose_adding_color(adding_colors)
    while true
      print "商品の番号を選択 > "
      select_adding_color_id = gets.to_i
      @chosen_adding_sneaker_color = adding_colors.find{|adding_color| adding_color.id == select_adding_color_id}
      break if !@chosen_adding_sneaker_color.nil?
      puts "#{adding_colors.first.id}から#{adding_colors.last.id}の番号から選んでください。"
    end
  end

  # 追加商品のサイズを選択
  def choose_adding_size(adding_sizes)
    while true
      print "商品の番号を選択 > "
      select_adding_size_id = gets.to_i
      @chosen_adding_sneaker_size = adding_sizes.find{|adding_size| adding_size.id == select_adding_size_id}
      break if !@chosen_adding_sneaker_size.nil?
      puts "#{adding_sizes.first.id}から#{adding_sizes.last.id}の番号から選んでください。"
    end
  end
  
end

# 商品一覧
sneaker_params = [
  { name: "Dunk" , price: 15000 },
  { name: "Air Max1" , price: 15000 },
  { name: "Air Jordan1" , price: 150000 },
  { name: "Air Force1" , price: 15000 },
  { name: "Air Blazer" , price: 15000 }
]

# 商品の色一覧
sneaker_colors = [
  { name: "black" },
  { name: "white" },
  { name: "green" },
  { name: "red" },
  { name: "blue" }
]

# 商品のサイズ一覧
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

# "はい"、"いいえ"一覧
sneaker_decisions = [
  { name: "はい" },
  { name: "いいえ" }
]

# 追加商品一覧
adding_sneaker_params = [
  { name: "Dunk" , price: 15000 },
  { name: "Air Max1" , price: 15000 },
  { name: "Air Jordan1" , price: 150000 },
  { name: "Air Force1" , price: 15000 },
  { name: "Air Blazer" , price: 15000 }
]

# 追加商品の色一覧
adding_sneaker_colors = [
  { name: "black" },
  { name: "white" },
  { name: "green" },
  { name: "red" },
  { name: "blue" }
]

# 追加商品のサイズ一覧
adding_sneaker_sizes = [
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

adding_sneaker_decisions = [
  { name: "はい" },
  { name: "いいえ" }
]

# sneaker_params, sneaker_colors, sneaker_sizes, decisions の商品を持つお店の開店
shop1 = Shop.new(sneaker_params, sneaker_colors, sneaker_sizes, sneaker_decisions, adding_sneaker_params, adding_sneaker_colors, adding_sneaker_sizes)

# お客さんの来店
user = User.new

# 商品の表示
shop1.ask_sneakers

# 商品の選択
user.choose_sneaker(shop1.sneakers)

# 商品の色の表示
shop1.ask_color(user.chosen_sneaker)

# 商品の色の選択
user.choose_color(shop1.colors)

#商品のサイズの表示
shop1.ask_size(user.chosen_sneaker_color)

#商品のサイズの選択
user.choose_size(shop1.sizes)

# "はい"か"いいえ"を表示
shop1.ask_decision(user.chosen_sneaker_size)

# "はい"か"いいえ"を選択
user.choose_decision(shop1.decisions)



# "2足目のスニーカーの購入"の表示
shop1.ask_adding_sneaker(user.chosen_sneaker_decision)

# 追加商品の選択
user.choose_adding_sneaker(shop1.adding_sneakers)

# 追加商品の色の表示
shop1.ask_adding_color(user.chosen_adding_sneaker)

# 追加商品の色を選択
user.choose_adding_color(shop1.adding_colors)

# 追加商品のサイズの表示
shop1.ask_adding_size(user.chosen_adding_sneaker_color)

# 追加商品のサイズを選択
user.choose_adding_size(shop1.adding_sizes)


5.rbにて、"はい"、"いいえ"の処理の実装（エラー）

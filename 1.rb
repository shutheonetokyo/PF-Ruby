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
  def initialize(sneaker_params)
    @sneakers = []
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
end

sneaker_params1 = [
  { name: "Dunk" , price: 15000 },
  { name: "Air Max1" , price: 15000 },
  { name: "Air Jordan1" , price: 150000 },
  { name: "Air Force1" , price: 15000 },
  { name: "Air Blazer" , price: 15000 }
]
sneaker_params2 = [
  { name: "Air Presto" , price: 15000 },
  { name: "Air Zoom" , price: 15000 },
  { name: "Air Vapor Max" , price: 15000 },
  { name: "Air Tailwind" , price: 15000 },
  { name: "Air More Uptempo" , price: 15000 }
]


shop1 = Shop.new(sneaker_params1)
shop2 = Shop.new(sneaker_params2)


shop1.disp_sneakers
shop2.disp_sneakers


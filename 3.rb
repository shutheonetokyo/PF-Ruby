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

  def initialize(sneaker_params, sneaker_colors)
    @sneakers = []
    register_sneaker(sneaker_params)
    @colors = []
    register_color(sneaker_colors)
  end

  def register_sneaker(sneaker_params)
    sneaker_params.each do |param|
      @sneakers <<Sneaker.new(param)
    end
  end
end


shop1 = Shop.new(sneaker_params1)

shop1.register_sneaker(adding_sneaker_params1)

shop1.register_color(sneaker_colors)


class SneakerColor
  attr_reader :id, :name

  @@count = 0

  def initialize(sneaker_colors)
    @id = @@count += 1
    @color = sneaker_colors[:name]
  end
end





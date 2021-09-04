class Sneaker
  attr_reader :id, :name, :price

  @@count = 30

  def initialize(sneaker_params)
    @id = @@count += 1
    @name = sneaker_params[:name]
    @price = sneaker_params[:price]
  end
end

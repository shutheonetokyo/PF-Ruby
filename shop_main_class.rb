require "./sneaker.rb"
require "./shop.rb"
require "./user.rb"

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

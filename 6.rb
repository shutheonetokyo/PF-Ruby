def ask_quantity(chosen_sneaker, chosen_sneaker_color, chosen_sneaker_size)
  puts "#{chosen_sneaker.name}で、色は#{chosen_sneaker_color.name}で、サイズは#{chosen_sneaker_size.name}ですね。もう1足ご購入していただくと、2足目が10%オフになるキャンペーンを実施中です!2足目を購入されますか？"
end

decisions = [
  { name: "はい" },
  { name: "いいえ"}
]




adding_sneaker_params = [
  { name: "Dunk" , price: 15000 },
  { name: "Air Max1" , price: 15000 },
  { name: "Air Jordan1" , price: 150000 },
  { name: "Air Force1" , price: 15000 },
  { name: "Air Blazer" , price: 15000 },
]

adding_sneaker_colors = [
  { name: "black" },
  { name: "white" },
  { name: "green" },
  { name: "red" },
  { name: "blue" }
]

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

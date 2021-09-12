def ask_quantity(chosen_sneaker, chosen_sneaker_color, chosen_sneaker_size)
  puts "#{chosen_sneaker.name}で、色は#{chosen_sneaker_color.name}で、サイズは#{chosen_sneaker_size.name}ですね。もう1足ご購入していただくと、2足目が10%オフになるキャンペーンを実施中です!2足目を購入されますか？"
end

decisions = [
  { name: "はい" },
  { name: "いいえ"}
]

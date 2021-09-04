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

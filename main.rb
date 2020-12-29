class Card
  attr_reader :remaining_card, :total_point
  def create_card(pictures, letters)
    @remaining_card = []
    letters.each.with_index(1) do |letter, i|
      i = 10 if i > 10 
      pictures.each do |picture|
        @remaining_card << {picture: picture, letter: letter, point: i}
      end
    end
  end

  def two_drow_card(remaining_card)
    @drew_card = []
    @total_point = 0
    i = -1
    2.times do 
      i += 1
      argument_num = rand(remaining_card.length - 1 - i)
      @drew_card << remaining_card[argument_num]
      remaining_card.delete_at(argument_num) 
      @total_point += @drew_card[i][:point]
    end 
  end

  def disp_have_card
    puts "#{@drew_card[0][:picture]} の#{@drew_card[0][:letter]} と #{@drew_card[1][:picture]} の#{@drew_card[1][:letter]}"
    puts "カードの合計 #{@total_point}"
  end

  def one_drow_card(remaining_card)
    argument_num = rand(remaining_card.length - 1)
    @drew_card << remaining_card[argument_num]
    @total_point += @drew_card.last[:point]
    remaining_card.delete_at(argument_num)
    puts "引いたカードは #{@drew_card.last[:picture]} の#{@drew_card.last[:letter]}" 
    puts "カードの合計 #{@total_point}"
    puts "ブラックジャック!!" if @total_point == 21
    puts "バースト!!" if @total_point > 21
  end
end

class Dealer < Card
  def first_drow(remaining_card)
    puts "ディーラーはカードを2枚引きました。"
    two_drow_card(remaining_card)
  end

  def add_card(remaining_card)
    puts "*=*=*=*=*=*=*=*=*==*=*=*=*"
    print "ディーラーのカード "
    disp_have_card
    while @total_point < 17
      one_drow_card(remaining_card)  
    end
  end
end

class Player < Card
  def first_drow(remaining_card)
    two_drow_card(remaining_card)
    print "あなたのカード "
    disp_have_card
  end

  def add_card(remaining_card)
    while true
      puts "*=*=*=*=*=*=*=*=*==*=*=*=*"
      puts "カードを追加しますか?"
      print "追加する場合は 1 追加しない場合は 2 を選択 >"
      chosen_num = gets.to_i
      one_drow_card(remaining_card) if chosen_num == 1
      break if chosen_num == 2 || @total_point >= 21 
    end
  end
end



pictures = ["♤", "♧", "♡", "♢"]
letters = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

card = Card.new
card.create_card(pictures, letters)
player = Player.new
dealer = Dealer.new

def win_or_lose(player, dealer)
  if player.total_point == dealer.total_point
    puts <<~EOS
    *=*=*=*=*=*=*=*=*==*=*=*=*
    引き分け
    EOS
  elsif player.total_point > dealer.total_point && player.total_point  <= 21 || dealer.total_point > 21
    puts <<~EOS
    *=*=*=*=*=*=*=*=*==*=*=*=*
    おめでとうございます!!
    あなたの勝利です!!
    EOS
  else
    puts <<~EOS
    *=*=*=*=*=*=*=*=*==*=*=*=*
    残念。
    あなたの敗北です。
    EOS
  end
end

puts "ゲーム開始です!"
dealer.first_drow(card.remaining_card)
player.first_drow(card.remaining_card)
player.add_card(card.remaining_card)
dealer.add_card(card.remaining_card) if player.total_point <= 21
win_or_lose(player, dealer)





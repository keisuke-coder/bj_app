require "./card.rb"
require "./dealer.rb"
require "./player.rb"

pictures = ["♤", "♧", "♡", "♢"]
letters = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

card = Card.new
card.create_card(pictures, letters)
dealer = Dealer.new
player = Player.new

def judge(player, dealer)
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

puts <<~EOS
ようこそブラックジャックへ!!
ゲーム開始です!!
EOS
dealer.first_drow(card.remaining_card)
player.first_drow(card.remaining_card)
player.add_card(card.remaining_card)
dealer.add_card(card.remaining_card) if player.total_point <= 21
judge(player, dealer)





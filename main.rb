class Card
  attr_reader :card
  attr_writer :card
  def create_card(pictures, letters)
    @card = []
    letters.each.with_index(1) do |letter, i|
      i = 10 if i > 10 
      pictures.each do |picture|
        @card << {picture: picture, letter: letter, point: i}
      end
    end
    @card
  end
end

class Player 
  def first_drow_card(dealer_first_drew_card)
    
  end
end

class Dealer 
  def first_drow_card(created_card)
    drew_card = []
    puts "ディーラーはカードを2枚引きました。"
    i = -1
    2.times do 
      i += 1
      argument_num = rand(51 - i)
      drew_card << created_card[argument_num]
      created_card.delete_at(argument_num)
    end 
    created_card
  end
end

pictures = ["♤", "♧", "♡", "♢"]
letters = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

card = Card.new
created_card = card.create_card(pictures, letters)
player = Player.new
dealer = Dealer.new

dealer_first_drew_card = dealer.first_drow_card(created_card)
player_first_drew_card = player.first_drow_card(dealer_first_drew_card)

#dealerのfirst_drow_cardが途中です



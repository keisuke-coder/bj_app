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
  end
end

class Player

end

class Dealer

end

pictures = ["♤", "♧", "♡", "♢"]
letters = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

card = Card.new
card.create_card(pictures, letters)

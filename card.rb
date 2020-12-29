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
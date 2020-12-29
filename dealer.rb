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
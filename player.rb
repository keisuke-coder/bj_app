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
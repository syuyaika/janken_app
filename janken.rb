def janken
  puts "じゃんけん・・・"
  puts "0:グー 1:チョキ 2:パー 3:戦わない"
  player_hand = gets.chomp

  if player_hand.match(/^[0-3]$/)
    if player_hand == "3"
      puts "ゲームを終了します"
      exit
    end
    player_hand.to_i
  else
    puts "不正な値です。0~3の数字を入力してください。"
    janken
  end
end

def janken_result(player, computer)
  if player == computer
    "あいこ"
  elsif (player == 0 && computer == 1) || (player == 1 && computer == 2) || (player == 2 && computer == 0)
    "勝ち"
  else
    "負け"
  end
end

def acchi_muite_hoi
  puts "あっち向いてホイ！"
  puts "0:上 1:下 2:左 3:右"
  player_hand2 = gets.chomp

  if player_hand2.match(/^[0-3]$/)
    player_hand2.to_i
  else
    puts "不正な値です。0~3の数字を入力してください。"
    acchi_muite_hoi
  end
end

def acchi_muite_hoi_result(player, computer)
  player == computer
end

loop do
  player_hand = janken
  computer_hand = rand(3)

  hands = ["グー", "チョキ", "パー"]
  puts "あなたの手: #{hands[player_hand]}, 相手の手: #{hands[computer_hand]}"

  result = janken_result(player_hand, computer_hand)

  if result == "あいこ"
    puts "あいこです。もう一度じゃんけんしましょう"
    next
  elsif result == "勝ち"
    puts "じゃんけんに勝ちました"
    player_direction = acchi_muite_hoi
    computer_direction = rand(4)
    directions = ["上", "下", "左", "右"]
    puts "あなたの指す方向: #{directions[player_direction]}, 相手の向く方向: #{directions[computer_direction]}"

    if acchi_muite_hoi_result(player_direction, computer_direction)
      puts "あなたの勝ちです"
      break
    else
      puts "引き分けです。もう一度じゃんけんから始めましょう。"
    end
  else
    puts "じゃんけんに負けました"
    computer_direction = rand(4)
    player_direction = acchi_muite_hoi
    directions = ["上", "下", "左", "右"]
    puts "相手の指す方向: #{directions[computer_direction]}, あなたの向く方向: #{directions[player_direction]}"

    if acchi_muite_hoi_result(player_direction, computer_direction)
      puts "あなたの負けです"
      break
    else
      puts "引き分けです。もう一度じゃんけんから始めましょう。"
    end
  end
end

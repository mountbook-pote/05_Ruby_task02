#ジャンケンの手に関する関数
def choiceHand(hand)
  case hand
  when "0"
    hand = "グー"
  when "1"
    hand = "チョキ"
  when "2"
    hand = "パー"
  when "3"
    puts "じゃんけんを終了します"
    hand = "break"
  else
    puts "無効な手です。0〜3の数字を入力してください"
    hand = "next"
  end
end

def judgeHand(your_hand, opponent_hand)
  if your_hand == opponent_hand
    return "tie"
  elsif (your_hand == "グー" && opponent_hand == "チョキ") ||
        (your_hand == "チョキ" && opponent_hand == "パー") ||
        (your_hand == "パー" && opponent_hand == "グー")
    return "you_won"
  else
    return "you_lost"
  end
end

#あっち向いてほいに関する関数
def choiceWay(way)
  case way
  when "0"
    way = "上"
  when "1"
    way = "下"
  when "2"
    way = "左"
  when "3"
    way = "右"
  else
    puts "無効な方向です。0〜3の数字を入力してください"
    way = "next"
  end
end

def lookThatway(judgement)
  while true
    puts "あっち向いて〜"
    puts "0(上), 1(下), 2(左), 3(右)"
    your_way = choiceWay(gets.chomp)
    opponent_way =choiceWay(["0", "1", "2", "3"].sample)

    if your_way == "next"
      next
    end

    puts "ホイ！"
    puts "-------------------"
    puts "あなたの方向：#{your_way}"
    puts "相手の方向：#{opponent_way}"
    
    if your_way == opponent_way && judgement == "you_won"
      puts "あなたの勝ちです！"
      return false #ジャンケンループ(外側)解除
    elsif your_way == opponent_way && judgement == "you_lost"
      puts "あなたの負けです･･･"
      return false #ジャンケンループ(外側)解除
    else
      puts "あっち向いてホイ引き分けです"
      puts "-------------------"
      return true #ジャンケンループ(外側)継続
    end
  end
end


#以下ジャンケンプログラム
rps_loop = true
while rps_loop #ジャンケンループ(外側)
  puts "じゃんけん･･･"
  puts "0(グー), 1(チョキ), 2(パー), 3(戦わない)"
  your_hand = choiceHand(gets.chomp)
  opponent_hand =choiceHand(["0", "1", "2",].sample)

  if your_hand == "break"
    break #ジャンケン終了
  elsif your_hand == "next"
    next #ジャンケン最初から
  end
  
  puts "ホイ！"
  puts "-------------------"
  puts "あなた：#{your_hand}を出しました"
  puts "相手：#{opponent_hand}を出しました"

  while true #ジャンケンループ(内側)
    judgement = judgeHand(your_hand, opponent_hand)
    if judgement == "you_won"
      puts "ジャンケン勝利！あなたが指す側です"
      puts "-------------------"
      rps_loop = lookThatway(judgement)
      break #ジャンケンループ(内側)を抜ける
    elsif judgement == "you_lost"
      puts "ジャンケン敗北･･･あなたが向く側です"
      puts "-------------------"
      rps_loop = lookThatway(judgement)
      break #ジャンケンループ(内側)を抜ける
    else #ジャンケンあいこの時
      puts "-------------------"
      puts "あいこで･･･"
      puts "0(グー), 1(チョキ), 2(パー), 3(戦わない)"
      your_hand = choiceHand(gets.chomp)
      opponent_hand =choiceHand(["0", "1", "2",].sample)

      if your_hand == "break"
        rps_loop = false #ジャンケンループ(外側)解除
        break #ジャンケンループ(内側)を抜ける
      end
      
      puts "ショ！"
      puts "-------------------"
      puts "あなた：#{your_hand}を出しました"
      puts "相手：#{opponent_hand}を出しました"
    end
  end
end
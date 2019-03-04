class Car
  # 定数を追加
  UP_SPEED = 10
  DOWN_SPEED = 20

  @@count = 0
  attr_accessor :number, :color
  # speedは外部から設定しないのでreaderで定義
  # @speedが使えるようになる
  attr_reader :speed

  def initialize(number, color)
    @number = number
    @color = color
    # @speedを初期化
    @speed = 0
    @@count += 1
  end

  # 加速用のメソッド追加
  def speed_up
    @speed += UP_SPEED
    alert = "[ALERT]" # [ALERT]部分の変更に備えて変数alertを代入

    # 30以上で警告。50以上で警告の上、20減速するif文を追加。
    if @speed >= 50
      puts "#{alert}スピードが#{@speed}になりました。減速します。"
      @speed -= 20
    elsif @speed >= 30
      puts "#{alert}スピードが#{@speed}になりました。"
    end
  end

  # 減速用のメソッド追加
  def speed_down
    # ifの結果を変数に代入する場合は以下の記述でOK
    @speed =
      if @speed - DOWN_SPEED < 0
        0
      else
        @speed - DOWN_SPEED
      end
  end

  def self.count
    @@count  # return @@countの略
  end
end


class TrackCar < Car
  attr_reader :load_weight

  def initialize(number, color, load_weight=500)
    @load_weight = load_weight
  end
end
